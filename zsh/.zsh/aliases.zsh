# env props
export hyprconfigs="$HOME/.config/hypr"
export dotfiles="$HOME/Dotfiles"
export dev="$HOME/Development"

[[ -e /bin/lsd ]] && alias ls="lsd"

if [[ -d $hyprconfigs ]]; then
  alias hyprconfigs="cd $hyprconfigs"
fi

if [[ -d $dotfiles ]]; then
  alias dotfiles="cd $dotfiles"
fi

if [[ -d $dev ]]; then
  alias dev="cd $dev"
fi
