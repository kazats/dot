export PATH="$HOME/.local/bin:$HOME/.ghcup/bin:$HOME/.cabal/bin:$PATH"

export DE="gnome"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"
export TERMCMD="wezterm"
export BROWSER="vivaldi-stable"
export MANPAGER="nvim +Man\!"

export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"

export SAL_USE_VCLPLUGIN="gtk3"
# export QT_STYLE_OVERRIDE="GTK+"

export NO_AT_BRIDGE=1

# export LIBVA_DRIVER_NAME="vdpau"
# export VDPAU_DRIVER="nvidia"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
