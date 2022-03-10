function fish_greeting; end
function fish_mode_prompt; end


if status is-login

  fish_add_path ~/.local/bin ~/.cabal/bin ~/.ghcup/bin


  set -xg DE                "gnome"
  set -xg LANG              "en_US.UTF-8"
  set -xg EDITOR            "nvim"
  set -xg VISUAL            "nvim"
  set -xg TERMCMD           "wezterm"
  set -xg BROWSER           "vivaldi-stable"
  set -xg MANPAGER          "nvim +Man\!"

  set -xg GTK_IM_MODULE     "fcitx"
  set -xg QT_IM_MODULE      "fcitx"
  set -xg XMODIFIERS        "@im=fcitx"

  set -xg SAL_USE_VCLPLUGIN "gtk3"
  set -xg NO_AT_BRIDGE      1
  # set -xg QT_STYLE_OVERRIDE "GTK+"

  set -xg FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS "--color=fg:#e0def4,bg:#1f1d2e,hl:#6e6a86 --color=fg+:#908caa,bg+:#191724,hl+:#908caa --color=info:#9ccfd8,prompt:#f6c177,pointer:#c4a7e7 --color=marker:#ebbcba,spinner:#eb6f92,header:#ebbcba"


  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx
  end
end


if status is-interactive

  fish_vi_key_bindings
  zoxide init fish | source


  alias home '~/.local/bin/scr/home.sh'
  alias lap  '~/.local/bin/scr/lap.sh'

  alias c    'cd'
  alias d    'cd && clear'
  alias b    'bat'
  alias s    'sudo'
  alias px   'chmod +x'
  alias rf   'rm -rf'
  alias cr   'cp -r'
  alias mv   'mv -i'
  alias md   'mkdir -p'
  alias lns  'ln -s'
  alias pp   'ping g.co'
  alias mo   'udisksctl mount -b'
  alias umo  'udisksctl unmount -b'

  alias o    'mimeopen'
  alias r    'ranger'
  alias tm   'tmux'
  alias v    'nvim'
  alias vd   'nvim -d'
  alias sv   'sudo nvim'
  alias g    'git'
  alias dot  'git --git-dir=$HOME/.dot --work-tree=$HOME'

  alias e    'exa --icons --group-directories-first --git'
  alias l    'e -TL1'
  alias l2   'e -TL2'
  alias l3   'e -TL3'
  alias l4   'e -TL4'
  alias lt   'e -T'
  alias la   'l -a'
  alias la2  'l2 -a'
  alias la3  'l3 -a'
  alias la4  'l4 -a'
  alias lat  'lt -a'
  alias ll   'e -l'
  alias lla  'll -a'
  alias lld  'll -d'
  alias ,l   'clear; l'

  alias dus  'du -hs'
  alias duu  'du -hd 1'
  alias dh   'df -h'
  alias ti   'du -hs ~/.local/share/Trash'
  alias trf  'rf ~/.local/share/Trash'

  alias ctl  'systemctl'
  alias sctl 'sudo systemctl'
  alias y    'paru'
  alias ys   'paru -S'
  alias p    'paruz'
  alias pm   'sudo pacman'
  alias pms  'sudo pacman -S'
  alias pmr  'sudo pacman -R'
  alias pmrs 'sudo pacman -Rs'
  alias pmu  'sudo pacman -U'
  alias pmss 'pacman -Ss'
  alias pmsi 'pacman -Si'
  alias pmqs 'pacman -Qs'
  alias pmqi 'pacman -Qi'
  alias pmqm 'pacman -Qm'
  alias pmc  'echo "y\nn\n" | s pacman -Scc'
  alias yy   'rf ~/.cache/paru'

  alias za   'zathura'
  alias vv   'vlc'
  alias lo   'libreoffice'
  alias ap   'apack'
  alias au   'aunpack'
  alias t    'clear; vitetris'
  alias h    'ghci'
  alias rh   'runhaskell'
  alias ca   'cabal'
  alias cau  'cabal update'
  alias cai  'cabal install'
  alias j    'java'
  alias jc   'javac'
  alias sc   'scala'
  alias mozc '/usr/lib/mozc/mozc_tool --mode=config_dialog'
  alias a    'acpi'
  alias ptop 'sudo powertop'
  alias ha   'systemctl poweroff'
  alias re   'systemctl reboot'
  alias kc   'eval `keychain --quiet --eval --agents ssh id_rsa`'
end


function rose_pine -a theme
  set -L

  switch $theme
    case 'dawn'
    set base     faf4ed
    set surface  fffaf3
    set overlay  f2e9de
    set inactive 9893a5
    set subtle   6e6a86
    set text     575279
    set love     b4637a
    set gold     ea9d34
    set rose     d7827e
    set pine     286983
    set foam     56949f
    set iris     907aa9
    case 'moon'
    set base     232136
    set surface  2a273f
    set overlay  393552
    set inactive 59546d
    set subtle   817c9c
    set text     e0def4
    set love     eb6f92
    set gold     f6c177
    set rose     ea9a97
    set pine     3e8fb0
    set foam     9ccfd8
    set iris     c4a7e7
    case '*'
    set base     191724
    set surface  1f1d2e
    set overlay  26233a
    set inactive 555169
    set subtle   6e6a86
    set text     e0def4
    set love     eb6f92
    set gold     f6c177
    set rose     ebbcba
    set pine     31748f
    set foam     9ccfd8
    set iris     c4a7e7
  end

  set -U fish_color_normal            normal
  set -U fish_color_command           $iris
  set -U fish_color_quote             $gold
  set -U fish_color_redirection       $pine
  set -U fish_color_end               $iris
  set -U fish_color_error             $love
  set -U fish_color_param             $text
  set -U fish_color_comment           $subtle
  set -U fish_color_match             --background=brblue
  set -U fish_color_selection         white --bold --background=brblack
  set -U fish_color_search_match      bryellow --background=brblack
  set -U fish_color_history_current   --bold
  set -U fish_color_operator          $foam
  set -U fish_color_escape            $foam
  set -U fish_color_cwd               green
  set -U fish_color_cwd_root          red
  set -U fish_color_valid_path        --underline
  set -U fish_color_autosuggestion    $subtle
  set -U fish_color_user              brgreen
  set -U fish_color_host              normal
  set -U fish_color_cancel            -r
  set -U fish_pager_color_completion  normal
  set -U fish_pager_color_description $rose yellow
  set -U fish_pager_color_prefix      white --bold --underline
  set -U fish_pager_color_progress    brwhite --background=cyan

  clear
end
