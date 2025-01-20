# Nushell Environment Config File
#
# version = "0.100"

def create_left_prompt [] {
}

def create_right_prompt [] {
    let home = $nu.home-path

    let dir = ([
        ($env.PWD | str substring 0..<($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let color = ansi -e { fg: black, bg: blue }
    let path_color = (if (is-admin) { ansi red } else { $color })
    let separator_color = (if (is-admin) { ansi light_red } else { ansi black })
    let path_segment = $"($path_color) ($dir)"
    let path = $" ($path_segment) " | str replace --all (char path_sep) $"($separator_color)/($path_color)"

    let git_status = gstat
    def changes_sum []: any -> int {
        transpose key value
        | filter {|l| ($l.value | describe) == int }
        | get value
        | reduce {|x,acc| $x + $acc }
    }
    let git = if ($git_status.branch != no_branch) {([
        (if (($git_status | changes_sum) > 0) {
            ansi -e { fg: yellow }
        } else {
            ansi -e { fg: blue }
        })
        (char space)
        $git_status.branch
    ] | str join)
    }

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi -e { fg: black, bg: red})
        (char space)
        ($env.LAST_EXIT_CODE)
        (char space)
        (ansi reset)
    ] | str join)
    } else { "" }

    ([$last_exit_code, $git, $path] | str join)
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

let prompt_insert  = ansi -e { fg: black bg: blue }
let prompt_normal  = ansi -e { fg: black bg: cyan }
let trans_normal   = ansi -e { fg: dark_gray bg: default }
$env.PROMPT_INDICATOR = {|| " ⟩ " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| $"($prompt_insert) ⟩ (ansi reset) " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"($prompt_normal) ⟩ (ansi reset) " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

$env.TRANSIENT_PROMPT_COMMAND = {|| create_left_prompt }
$env.TRANSIENT_PROMPT_INDICATOR = {|| " ⟩ " }
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| $"($trans_normal)(do $env.PROMPT_COMMAND) ⟩  (ansi reset)" }
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| $"($trans_normal)(do $env.PROMPT_COMMAND) ⟩  (ansi reset)" }
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "::: " }
$env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| $"($trans_normal)(create_right_prompt | ansi strip)(ansi reset)" }


# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: {|s| $s | split row (char esep) | path expand --no-symlink }
        to_string: {|v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: {|s| $s | split row (char esep) | path expand --no-symlink }
        to_string: {|v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
    ($nu.default-config-dir | path join 'completions')
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

$env.PATH = $env.PATH | split row (char esep) | prepend [
  ($env.HOME | path join .local bin)
  ($env.HOME | path join .cabal bin)
  ($env.HOME | path join .ghcup bin)
  #~/.local/opt/go/bin
  #~/Android/Sdk/cmdline-tools/latest/bin
] | uniq


use ~/.config/nushell/plugins/bash-env-nushell/bash-env.nu
bash-env /etc/profile | load-env

$env.XDG_CONFIG_HOME = $env.HOME | path join .config
$env.XDG_CACHE_HOME  = $env.HOME | path join .cache
$env.XDG_DATA_HOME   = $env.HOME | path join .local share
$env.XDG_STATE_HOME  = $env.HOME | path join .local state

$env.DE                = 'gnome'
$env.LANG              = 'en_US.UTF-8'
$env.EDITOR            = 'nvim'
$env.VISUAL            = 'nvim'
$env.TERMCMD           = 'wezterm'
$env.BROWSER           = 'vivaldi'
$env.MANPAGER          = 'nvim +Man!'
$env.BAT_PAGER         = 'less -RFi -j.5 --incsearch'
$env.LS_COLORS         = 'rs=0:di=00;34:ln=00;36:mh=00:pi=40;33:so=00;35:do=00;35:bd=40;33;00:cd=40;33;00:or=31;00:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arc=00;31:*.arj=00;31:*.taz=00;31:*.lha=00;31:*.lz4=00;31:*.lzh=00;31:*.lzma=00;31:*.tlz=00;31:*.txz=00;31:*.tzo=00;31:*.t7z=00;31:*.zip=00;31:*.z=00;31:*.dz=00;31:*.gz=00;31:*.lrz=00;31:*.lz=00;31:*.lzo=00;31:*.xz=00;31:*.zst=00;31:*.tzst=00;31:*.bz2=00;31:*.bz=00;31:*.tbz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.war=00;31:*.ear=00;31:*.sar=00;31:*.rar=00;31:*.alz=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.cab=00;31:*.wim=00;31:*.swm=00;31:*.dwm=00;31:*.esd=00;31:*.jpg=00;35:*.jpeg=00;35:*.mjpg=00;35:*.mjpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.svgz=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.webm=00;35:*.webp=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.flv=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.cgm=00;35:*.emf=00;35:*.ogv=00;35:*.ogx=00;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
$env.SSH_AUTH_SOCK     = $env.XDG_RUNTIME_DIR | path join gcr ssh
$env.CRYPTOGRAPHY_OPENSSL_NO_LEGACY = 1

$env.GTK_IM_MODULE  = 'fcitx'
$env.QT_IM_MODULE   = 'fcitx'
$env.GLFW_IM_MODULE = 'ibus'
$env.XMODIFIERS     = '@im=fcitx'

$env.CHROME_EXECUTABLE  = '/usr/bin/google-chrome-stable'
$env.PYP_CONFIG_PATH    = $env.XDG_CONFIG_HOME | path join pyp config.py
$env.SHH_DIR            = $env.XDG_CONFIG_HOME | path join shh
$env.IRBRC              = $env.XDG_CONFIG_HOME | path join irb irbrc
$env.PARALLEL_HOME      = $env.XDG_CONFIG_HOME | path join parallel
$env.MPLAYER_HOME       = $env.XDG_CONFIG_HOME | path join mplayer
$env.ZDOTDIR            = $env.XDG_CONFIG_HOME | path join zsh
$env.ANDROID_HOME       = $env.XDG_DATA_HOME   | path join Android Sdk
$env.WINEPREFIX         = $env.XDG_DATA_HOME   | path join wine
$env.LEIN_HOME          = $env.XDG_DATA_HOME   | path join lein
$env.CARGO_HOME         = $env.XDG_DATA_HOME   | path join cargo
$env.JULIA_DEPOT_PATH   = [
  ($env.XDG_DATA_HOME | path join julia)
  ($env | get -i JULIA_DEPOT_PATH | default '')] | str join :
$env.SQLITE_HISTORY     = $env.XDG_CACHE_HOME | path join sqlite_history
$env.NO_AT_BRIDGE       = 1
$env.SAL_USE_VCLPLUGIN  = 'gtk3'
# $env.QT_STYLE_OVERRIDE  = "GTK+"
$env._JAVA_OPTIONS      = '-Dawt.useSystemAAFontSettings=on'
$env.GHCUP_USE_XDG_DIRS = 1
$env.STACK_XDG          = 1
$env.BUNDLE_USER_CONFIG = $env.XDG_CONFIG_HOME | path join bundle
$env.BUNDLE_USER_CACHE  = $env.XDG_CACHE_HOME | path join bundle
$env.BUNDLE_USER_PLUGIN = $env.XDG_DATA_HOME | path join bundle
$env.FZF_DEFAULT_OPTS   = [
  "--cycle --height=50% --border=none --margin=0,1,0,0"
  "--preview-window=border-none,nowrap"
  "--prompt=''" "--pointer=' ⟩'" "--marker=' ┃'"
  "--color=fg:#e0def4,bg:#191724,hl:#c4a7e7"
  "--color=fg+:#e0def4:regular,bg+:#26233a,hl+:#c4a7e7:regular:reverse"
  "--color=prompt:#9ccfd8:regular,pointer:#c4a7e7:regular,marker:#c4a7e7:regular"
  "--color=spinner:#c4a7e7:regular,info:#555169:regular,header:#c4a7e7:regular"
  "--color=gutter:#191724,query:#c4a7e7:regular"
] | str join (char space)

# $env.GOPATH            = $env.HOME | path join .local opt go
# $env.LIBVA_DRIVER_NAME   = "radeonsi"
# $env.VDPAU_DRIVER        = "nvidia"
# $env.LIBVA_DRIVER_NAME   = "vdpau"
# $env.XDG_SCREENSHOTS_DIR = ~/m/p/scr
