DISABLE_AUTO_UPDATE=true
DISABLE_AUTO_TITLE=true

MNML_USER_CHAR="⟩"
MNML_OK_COLOR=white
MNML_ERR_COLOR=red
MNML_PROMPT=(mnml_ssh mnml_pyenv mnml_status)
MNML_RPROMPT=('mnml_cwd 100 0' mnml_git)
MNML_INFOLN=(mnml_err mnml_jobs mnml_uhp mnml_files)

# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

setopt appendhistory autocd extendedglob nomatch notify histignorealldups
unsetopt correct_all beep histignorespace share_history
bindkey -v
autoload -Uz compinit
compinit
unset GREP_OPTIONS
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000
KEYTIMEOUT=1
WORDCHARS=${WORDCHARS//[\/]}

# Completion files: Use XDG dirs
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# zsh-history-substring-search

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

alias lap='. ~/.screenlayout/lap.sh'
alias home='. ~/.screenlayout/home.sh'
alias sr='source ~/.zshrc'
alias en='LANG="en_US.UTF-8"'
alias ja='LANG="ja_JP.UTF-8"'
alias ko='LANG="ko_KR.UTF-8"'
alias tw='LANG="zh_TW.UTF-8"'

alias s='sudo'
alias r='ranger'
alias c='cd'
alias d='cd && clear'
alias px='chmod +x'
alias rf='rm -rf'
alias cr='cp -r'
alias mv='mv -i'
alias md='mkdir -p'
alias lns='ln -s'
alias b='bat'

alias e='exa --icons --group-directories-first'
alias l='e -TL1'
alias l2='e -TL2'
alias l3='e -TL3'
alias l4='e -TL4'
alias lt='e -T'
alias la='l -a'
alias la2='l2 -a'
alias la3='l3 -a'
alias la4='l4 -a'
alias lat='lt -a'
alias ll='e -l'
alias lla='ll -a'
alias lld='ll -d'

alias dus='du -hs'
alias duu='du -hd 1'
alias dh='df -h'
alias ti='du -hs ~/.local/share/Trash'
alias trf='rf ~/.local/share/Trash'

alias ctl='systemctl'
alias sctl='sudo systemctl'
alias y='paru'
alias ys='paru -S'
alias p='paruz'
alias pm='sudo pacman'
alias pms='sudo pacman -S'
alias pmr='sudo pacman -R'
alias pmrs='sudo pacman -Rs'
alias pmu='sudo pacman -U'
alias pmss='pacman -Ss'
alias pmsi='pacman -Si'
alias pmqs='pacman -Qs'
alias pmqi='pacman -Qi'
alias pmqm='pacman -Qm'
alias pmc='echo "y\nn\n" | s pacman -Scc'
alias yy='rf ~/.cache/paru'
alias o='mimeopen'
alias tm='tmux'
alias v='nvim'
alias vd='nvim -d'
alias sv='sudo nvim'
alias g='git'
alias dot='git --git-dir=$HOME/.dot --work-tree=$HOME'
alias z='zathura'
alias vv='vlc'
alias lo='libreoffice'
alias pp='ping g.co'
alias ap='apack'
alias au='aunpack'
alias t='clear; vitetris'
# alias    ts='~/_/g/tetris/gameserver'
# alias    mcs='cd ~/_/g/minecraft && java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui'
alias h='ghci'
alias rh='runhaskell'
alias ca='cabal'
alias cau='cabal update'
alias cai='cabal install'
alias j='java'
alias jc='javac'
alias sc='scala'
alias mozc='/usr/lib/mozc/mozc_tool --mode=config_dialog'
# alias    sei='encfs ~/Dropbox/to/.sei ~/ん/正'
# alias    usei='fusermount -u ~/ん/正'
alias a='acpi'
alias ptop='sudo powertop'
# alias    uon='sudo vpnc uni.conf'
# alias    uoff='sudo vpnc-disconnect'
# alias    von='sudo openconnect --user=<n> -b asa.rz.uni-augsburg.de'
# alias    voff='sudo killall openconnect'
alias ha='systemctl poweroff'
alias re='systemctl reboot'
alias kc='eval `keychain --quiet --eval --agents ssh id_rsa`'
alias ,l=', l'

alias -s pdf='mimeopen'
alias -s djvu='mimeopen'
alias -s jpg='mimeopen'
alias -s jpeg='mimeopen'
alias -s png='mimeopen'
alias -s gif='mimeopen'
alias -s bmp='mimeopen'
alias -s mp3='mimeopen'
alias -s mp4='mimeopen'
alias -s m4a='mimeopen'
alias -s avi='mimeopen'
alias -s mkv='mimeopen'
alias -s odt='mimeopen'
alias -s ods='mimeopen'
alias -s odp='mimeopen'
alias -s doc='mimeopen'
alias -s docx='mimeopen'
alias -s ppt='mimeopen'
alias -s pptx='mimeopen'
alias -s zip='mimeopen'
alias -s rar='mimeopen'
alias -s tar='mimeopen'
alias -s gz='mimeopen'
alias -s bz2='mimeopen'
alias -s xz='mimeopen'
alias -s html='mimeopen'
alias -s exe='mimeopen'
alias -s EXE='mimeopen'
alias -s hs='runhaskell'
function oki {
  sudo rtcwake -m "$1" -t $(date +%s -d "$2")
  raku c play
  clear
}
function mdc {
  md $1 && c $1
}
function kk {
  eval `keychain --quiet --eval --agents ssh $1`
}
function , {
  clear
  zsh -ci "$@"
}
function ., {
  zsh -ci "$@"
  clear
}
function ,., {
  clear
  zsh -ci "$@"
  clear
}
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /home/v/.config/broot/launcher/bash/br
