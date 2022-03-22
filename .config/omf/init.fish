function fish_greeting; end
function fish_mode_prompt; end


if status is-login

  bass source /etc/profile
  # fish_add_path /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl /usr/lib/jvm/default/bin /opt/cuda/bin /opt/cuda/nsight_compute /opt/cuda/nsight_systems/bin
  fish_add_path ~/.local/bin ~/.cabal/bin ~/.ghcup/bin

  set -xg DE                "gnome"
  set -xg LANG              "en_US.UTF-8"
  set -xg EDITOR            "nvim"
  set -xg VISUAL            "nvim"
  set -xg TERMCMD           "wezterm"
  set -xg BROWSER           "vivaldi"
  set -xg MANPAGER          "nvim +Man\!"

  set -xg GTK_IM_MODULE     "fcitx"
  set -xg QT_IM_MODULE      "fcitx"
  set -xg XMODIFIERS        "@im=fcitx"

  set -xg SAL_USE_VCLPLUGIN "gtk3"
  set -xg NO_AT_BRIDGE      1
  # set -xg QT_STYLE_OVERRIDE "GTK+"

  set -xg CUDA_PATH         /opt/cuda
  set -xg --path XDG_DATA_DIRS /usr/local/share /usr/share


  set -xg LS_COLORS 'rs=0:di=00;34:ln=00;36:mh=00:pi=40;33:so=00;35:do=00;35:bd=40;33;00:cd=40;33;00:or=31;00:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arc=00;31:*.arj=00;31:*.taz=00;31:*.lha=00;31:*.lz4=00;31:*.lzh=00;31:*.lzma=00;31:*.tlz=00;31:*.txz=00;31:*.tzo=00;31:*.t7z=00;31:*.zip=00;31:*.z=00;31:*.dz=00;31:*.gz=00;31:*.lrz=00;31:*.lz=00;31:*.lzo=00;31:*.xz=00;31:*.zst=00;31:*.tzst=00;31:*.bz2=00;31:*.bz=00;31:*.tbz=00;31:*.tbz2=00;31:*.tz=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.war=00;31:*.ear=00;31:*.sar=00;31:*.rar=00;31:*.alz=00;31:*.ace=00;31:*.zoo=00;31:*.cpio=00;31:*.7z=00;31:*.rz=00;31:*.cab=00;31:*.wim=00;31:*.swm=00;31:*.dwm=00;31:*.esd=00;31:*.jpg=00;35:*.jpeg=00;35:*.mjpg=00;35:*.mjpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.svgz=00;35:*.mng=00;35:*.pcx=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.m2v=00;35:*.mkv=00;35:*.webm=00;35:*.webp=00;35:*.ogm=00;35:*.mp4=00;35:*.m4v=00;35:*.mp4v=00;35:*.vob=00;35:*.qt=00;35:*.nuv=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:*.avi=00;35:*.fli=00;35:*.flv=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.cgm=00;35:*.emf=00;35:*.ogv=00;35:*.ogx=00;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
  # set -xg LS_COLORS 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

  fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --processes=\cp

  set -xg FZF_DEFAULT_OPTS    --cycle --layout=reverse --height=50% --border=none --margin=0,1,0,0 \
                              --preview-window=border-none,nowrap \
                              "--prompt=''" "--pointer=' ⟩'" "--marker=' ┃'" \
                              --color=fg:#e0def4,bg:#191724,hl:#c4a7e7 \
                              --color=fg+:#e0def4:regular,bg+:#26233a,hl+:#c4a7e7:regular:reverse \
                              --color=prompt:#9ccfd8:regular,pointer:#c4a7e7:regular,marker:#c4a7e7:regular \
                              --color=spinner:#c4a7e7:regular,info:#555169:regular,header:#c4a7e7:regular \
                              --color=gutter:#191724,query:#c4a7e7:regular
  set -xg fzf_preview_dir_cmd  exa --icons --group-directories-first --git -TL1
  set -xg fzf_preview_file_cmd bat --style 'changes' --color=always
  set -xg fzf_fd_opts          -H --ignore-file ~/.fdignore


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
  alias q    'git --git-dir=$HOME/.dot --work-tree=$HOME'

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
  alias pmc  'sudo pacman -Scc'
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
