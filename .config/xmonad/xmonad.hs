{-# OPTIONS_GHC -Wno-missing-signatures #-}
{-# LANGUAGE RecordWildCards #-}
import XMonad

import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive  (fadeInactiveLogHook)
import XMonad.Hooks.ManageDocks   (manageDocks)
import XMonad.Hooks.ManageHelpers (doCenterFloat, doFullFloat, isFullscreen, isDialog)
import XMonad.Hooks.ScreenCorners
import XMonad.Hooks.SetWMName     (setWMName)
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.Fullscreen   (fullscreenManageHook)
import XMonad.Layout.NoBorders    (smartBorders)
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Tabbed
-- import XMonad.Layout.GridVariants (Orientation (..), SplitGrid (..))
-- import XMonad.Layout.PerWorkspace (onWorkspaces)
import XMonad.Layout.Reflect      (reflectHoriz, reflectVert)

import XMonad.Util.Cursor         (setDefaultCursor)
import XMonad.Util.SpawnOnce      (spawnOnce)

import qualified Data.Map as M
import Graphics.X11.ExtraTypes.XF86
-- import Graphics.X11.ExtraTypes.XorgDefault

import Control.Arrow              (second)
import System.Exit                (exitSuccess)


main = xmonad
    . setEwmhActivateHook doAskUrgent
    . ewmhFullscreen
    . ewmh
    $ def
    -- { terminal            = "alacritty"
    { focusFollowsMouse   = True
    , borderWidth         = 2
    -- , modMask             = mod1Mask
    , workspaces          = return <$> "qwerasdf1234"
    , normalBorderColor   = "#000000"
    , focusedBorderColor  = "#6e6a86"
    , keys                = myKeys
    , mouseBindings       = myMouse
    , layoutHook          = myLayout
    , manageHook          = composeAll [ fullscreenManageHook, manageDocks, myManageHook ]
    , handleEventHook     = composeAll [ screenCornerEventHook ] --docksEventHook ]
    , logHook             = fadeInactiveLogHook 0xffffffff --0xe6666666
    , startupHook         = myStartupHook
    }


-- WORKSPACES
myLayout
    = smartBorders
    . screenCornerLayoutHook
    -- . avoidStruts
    -- . onWorkspaces (return <$> "qdf3") fullF
    $ tiledF

    where
    tiledF = tiled ||| full ||| simplestFloat

    tiled  = reflectHoriz $ Tall 1 (5/100) (1/2)
    -- tabs   = tabbed shrinkText $ def {
    --   fontName      = "Iosevka Term Light Extended",
    --   activeColor   = "#6e6a86",
    --   inactiveColor = "#191724"
    -- }
    -- vGrid  = reflectHoriz $ SplitGrid R 2 3 (3/4) (16/10) (5/100)
    -- hGrid  = reflectVert vGrid
    -- hGrid  = SplitGrid L 2 1 (1/3) (5/4) (5/100)
    full = Full


myManageHook = composeAll $ concatMap withMatch
    [ shift "1" ｜ []
    , shift "q" ｜ ["Chromium", "Firefox", "google-chrome", "Opera", "vivaldi-stable"]
    , shift "a" ｜ []

    , shift "2" ｜ ["anytype"]
    , shift "w" ｜ ["main"]
    , shift "s" ｜ []

    , shift "3" ｜ ["yazi", "ranger", "Transmission-gtk"]
    , shift "e" ｜ ["Xephyr", "vlc"]
    , shift "d" ｜ ["anki"]

    , shift "4" ｜ ["htop"]
    , shift "r" ｜ ["vmware", "VirtualBox Manager", "VirtualBox Machine"]
    , shift "f" ｜ ["easyeffects", "skype", "zoom", "cmus", "spotify"]

    , dofloat   ｜ ["foxwq.exe", "lxqt-openssh-askpass", "Zotero Preferences", "Quick Format Citation", "Add-ons Manager", "Extension Manager", "sun-awt-X11-XFramePeer"]
    , ignore    ｜ ["desktop", "desktop_window", "trayer"]
    ]
    ++
    [ isFullscreen --> doFullFloat
    , isDialog     --> dofloat ]

    where
    withMatch (f, w) = (--> f) . matchAny <$> w
    matchAny x       = or <$> mapM (=? x) [title, appName, className]

    shift   = doShift
    dofloat = doCenterFloat
    ignore  = doIgnore

-- xprop | grep WM_CLASS
-- [ [ matchAny w --> doShift "1"   | w <- forWS1  ]

-- doSink  = do
--     w <- ask
--     liftX $ reveal w
--     doF $ W.sink w


-- BINDINGS
myKeys XConfig
    { workspaces = spaces
    , layoutHook = layout
    } = M.fromList $

    map (second spawn)
    [ a  xK_grave         ｜ rofi "run"
    , a  xK_Return        ｜ termNew
    , as xK_Return        ｜ nvim

    , m  xK_w             ｜ vivaldi
    , m  xK_e             ｜ easyeffects
    , m  xK_r             ｜ ranger
    , m  xK_t             ｜ anytype
    , m  xK_y             ｜ yazi
    , m  xK_o             ｜ ogatak
    , m  xK_p             ｜ pavucontrol

    , m  xK_a             ｜ anki
    , m  xK_g             ｜ gimp
    , m  xK_h             ｜ htop
    , m  xK_k             ｜ katrain
    , m  xK_l             ｜ libreoffice

    , m  xK_z             ｜ zoom
    , m  xK_x             ｜ openbox
    , m  xK_v             ｜ vmware
    , m  xK_b             ｜ blueman

    , n  xK_Print         ｜ scrot
    , a  xK_Pause         ｜ "systemctl suspend"

    , m  xK_space         ｜ dunstctl "close"
    , ms xK_space         ｜ dunstctl "close-all"
    , m  xK_grave         ｜ dunstctl "history-pop"
    , m  xK_period        ｜ dunstctl "action"

    , n  audioLower       ｜ volumeDec
    , n  audioRaise       ｜ volumeInc
    , n  audioMute        ｜ volumeToggle
    , a  xK_Escape        ｜ volumeToggle
    , a  xK_F1            ｜ volumeDec
    , a  xK_F2            ｜ volumeInc
    , m  xK_F1            ｜ soundHDMI
    , m  xK_F2            ｜ soundAnalog
    , m  xK_F3            ｜ soundBlue

    , n  brightDown       ｜ brightnessDec
    , n  brightUp         ｜ brightnessInc
    , a  xK_F3            ｜ brightnessDec
    , a  xK_F4            ｜ brightnessInc
    , a  xK_F5            ｜ brightnessTgl

    -- , a  xK_Tab           ｜ mediaToggle
    -- , n  audioPlay        ｜ "xdotool key ctrl+comma"
    -- , n  audioPrev        ｜ "xdotool key ctrl+m"
    -- , n  audioNext        ｜ "xdotool key ctrl+period"
    -- , n  xK_kana_fullstop ｜ mediaPrevious
    -- , n  scroll           ｜ mediaNext
    -- , a  xK_F3            ｜ muteChrome
    -- , a  xK_F4            ｜ mute
    -- , a  xK_F5            ｜ nom15
    -- , n  xK_KP_Divide     ｜ volumeSave0
    -- , n  xK_KP_Multiply   ｜ volumeSave1
    -- , n  xK_KP_Subtract   ｜ volumeState
    -- , n  xK_KP_Add        ｜ mute
    -- , n  xK_KP_Insert     ｜ muteChrome
    -- , n  xK_KP_Delete     ｜ muteChrome
    -- , n  xK_KP_Home       ｜ muteN 0
    -- , n  xK_KP_Up         ｜ muteN 1
    -- , n  xK_KP_Prior      ｜ muteN 2
    -- , n  xK_KP_Left       ｜ muteN 3
    -- , n  xK_KP_Begin      ｜ muteN 4
    -- , n  xK_KP_Right      ｜ muteN 5
    ]
    ++
    [ as xK_q             ｜ kill
    , a  xK_space         ｜ sendMessage NextLayout
    , as xK_space         ｜ setLayout layout
    , a  xK_n             ｜ refresh
    , a  xK_j             ｜ windows W.focusDown
    , a  xK_k             ｜ windows W.focusUp
    , a  xK_l             ｜ windows W.focusUp
    , a  xK_h             ｜ windows W.focusDown
    , a  xK_g             ｜ windows W.focusUp
    , a  xK_t             ｜ windows W.focusDown
    , a  xK_m             ｜ windows W.focusMaster
    , as xK_m             ｜ windows W.swapMaster
    , as xK_j             ｜ windows W.swapDown
    , as xK_k             ｜ windows W.swapUp
    , as xK_h             ｜ sendMessage Expand
    , as xK_l             ｜ sendMessage Shrink
    , a  xK_v             ｜ withFocused $ windows . W.sink
    , a  xK_comma         ｜ sendMessage $ IncMasterN (-1)
    , a  xK_period        ｜ sendMessage $ IncMasterN 1
    -- , a  xK_x             ｜ sendMessage ToggleStruts
    , as xK_e             ｜ io exitSuccess

    , a  xK_i             ｜ toggleWS
    , a  xK_x             ｜ toggleWS
    , a  xK_u             ｜ prevWS
    , a  xK_p             ｜ nextWS
    , as xK_u             ｜ shiftToPrev >> prevWS
    , as xK_p             ｜ shiftToNext >> nextWS

    , a  xK_Tab           ｜ nextScreen
    , as xK_Tab           ｜ shiftNextScreen >> nextScreen
    , m  xK_Tab           ｜ swapNextScreen
    , ms xK_Tab           ｜ swapNextScreen >> nextScreen
    ]
    ++
    [ (m k, f i)
    | (i, k) <- spaces `zip` concat [qr, af, [xK_1..xK_4]]
    , (f, m) <- [ windows . W.view  ｜ a
                , windows . W.shift ｜ ac ]
    ]

    where
    audioLower = xF86XK_AudioLowerVolume
    audioRaise = xF86XK_AudioRaiseVolume
    audioMute  = xF86XK_AudioMute
    -- audioPlay  = xF86XK_AudioPlay
    -- audioPrev  = xF86XK_AudioPrev
    -- audioNext  = xF86XK_AudioNext
    brightDown = xF86XK_MonBrightnessDown
    brightUp   = xF86XK_MonBrightnessUp
    -- eject      = xF86XK_Eject
    -- scroll     = xK_Scroll_Lock

    af = [xK_a, xK_s, xK_d, xK_f]
    qr = [xK_q, xK_w, xK_e, xK_r]

    -- toggle ws = do
    --     current <- W.tag . W.workspace . W.current . windowset <$> get

    --     if current == ws
    --     then toggleWS
    --     else windows $ W.greedyView ws


myMouse XConfig {} = M.fromList $
    [ a button1 ｜ \w -> do
        focus w
        mouseMoveWindow w
        windows W.shiftMaster

    , a button2 ｜ \w -> do
        focus w
        windows W.shiftMaster

    , a button3 ｜ \w -> do
        focus w
        mouseResizeWindow w
        windows W.shiftMaster

    -- , n 6  ｜ const prevWS
    -- , n 7  ｜ const nextWS
    -- , n 10 ｜ const toggleWS
    ]
    ++ playback
    ++ volume

    where
    playback = [ c btn ｜ const . spawn $ xdokey cmd | (btn, cmd) <-
        [ (button1, "m")
        , (button2, "comma")
        , (button3, "period")
        ] ]
    volume = [ m btn ｜ const $ spawn cmd | (btn, cmd) <-
        [ (button4, volumeInc)
        , (button2, volumeToggle)
        , (button5, volumeDec)
        ] ]


n   = (,) 0
a   = (,) mod1Mask
m   = (,) mod4Mask
c   = (,) controlMask
-- s   = (,) shiftMask
ac  = (,) $ mod1Mask .|. controlMask
as  = (,) $ mod1Mask .|. shiftMask
ms  = (,) $ mod4Mask .|. shiftMask
-- hyp  = n . (xK_Hyper_R .|.)

infixr 0 ｜
(｜) = (,)


-- AUTOSTART
myStartupHook = do
    setDefaultCursor xC_left_ptr
    setWMName "LG3D"
    addScreenCorners
        [ (SCLowerLeft,  spawn volumeToggle)
        , (SCLowerRight, spawn volumeDec)
        , (SCUpperLeft,  spawn volumeDec)
        , (SCUpperRight, spawn volumeInc)
        ]

    mapM_ spawnOnce
       [ xset
       , warpd
       , nitrogen
       , fcitx
       , mainTerminal
       , htop
       , yazi
       , redshift
       , easyeffects
       ]


-- PROGRAMS
-- autocutsel    = "autocutsel -fork" ＆ "autocutsel -s PRIMARY -fork"
anytype       = "anytype"
fcitx         = "fcitx5"
nitrogen      = "nitrogen --restore"
htop          = term "htop" "htop -u v"
mainTerminal  = termClass "main"
-- picom         = "picom --experimental-backends"
ranger        = term "ranger" "ranger"
redshift      = "redshift -l 48.4:10.9 -t 6500:3500"
-- unclutter     = "unclutter -idle 5 -root"
warpd         = "warpd"
-- xcape         = "xcape -e 'Mode_switch=Scroll_Lock'"
xset          = "xset r rate 250; xset dpms 0 0 0; xset s off"

anki          = "anki -b ~/.anki"
-- dmenu         = "dmenu-run"
blueman       = "blueman-manager"
dunstctl      = ("dunstctl " ++)
easyeffects   = "easyeffects"
gimp          = "gimp"
nvim          = term "nvim" "nvim"
katrain       = "prime-run katrain"
libreoffice   = "libreoffice"
openbox       = "ob"
ogatak        = "ogatak"
pavucontrol   = "pavucontrol"
rofi          = ("rofi -m -4 -show " ++)
scrot         = "scrot-mv"
transmission  = "transmission-gtk"
vivaldi       = "vivaldi"
vmware        = "vmware"
yazi          = term "yazi" "nu -e y"
zoom          = "zoom"

volumeDec     = "control v -"
volumeInc     = "control v +"
volumeToggle  = "control v %"

soundHDMI     = "control s h"
soundAnalog   = "control s a"
soundBlue     = "control s b"

brightnessDec = "control b -"
brightnessInc = "control b +"
brightnessTgl = "control b %"

xdokey        = ("xdotool key " ++)

-- mediaToggle   = "raku c toggle"
-- mediaPrevious = "raku c prev"
-- mediaNext     = "raku c next"
-- mute          = "mute"
-- muteN n       = "mute " ++ show n
-- muteChrome    = par ["mute Chrome", volumeState, mediaToggle]
-- xdoRakuT      = "xdotool behave_screen_edge --quiesce 0 bottom-left exec raku c toggle"
-- xdoVolumeT    = "xdotool behave_screen_edge --quiesce 0 bottom-right exec volume %"
-- xcalib        = "xcalib ~/Dropbox/_/LG_Flatron_E2340T.icc"
-- captureToggle = "amixer sset Capture toggle"
-- dpmsOff       = "xset -dpms" ＆ "xset s off"
-- mkeys         = "xkbset m" ＆ "xkbset exp =m"
-- numlockx      = "numlockx"
-- xbindkeys     = "xbindkeys"


data Term = Term
    { termCmd  :: !String
    , classOpt :: !String
    , execOpt  :: !String
    }

term cls cmd  = wezterm (Just cls) (Just cmd)
termNew       = wezterm Nothing Nothing
termClass cls = wezterm (Just cls) Nothing
-- termExec e  = term' Nothing   (Just e)

wezterm = termGeneric weztermConfig

termGeneric :: Term -> Maybe String -> Maybe String -> String
termGeneric Term{..} clsStr cmdStr = do
    let cls = maybe [] (\x -> [classOpt, x]) clsStr
        cmd = maybe [] (\x -> [execOpt, x]) cmdStr

    unwords $ [termCmd] ++ cls ++ cmd

weztermConfig = Term "wezterm start" "--class" "--"
-- weztermConfig = Term "wezterm start --always-new-process" "--class" "--"


-- a ＆ b   = unwords [a, "&&", b]
-- par      = unwords . ("parallel :::" :) . map q
-- q s      = concat ["\"", s, "\""]
