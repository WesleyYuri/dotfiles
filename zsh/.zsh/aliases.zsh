# env props
export hyprconfigs="$HOME/.config/hypr"
export waybar="$HOME/.config/waybar"

export dotfiles="$HOME/Dotfiles"
export dev="$HOME/Development"

[[ -e /bin/lsd ]] && alias ls="lsd"

if [[ -d $hyprconfigs ]]; then
  alias hyprconfigs="nvim $hyprconfigs"
fi

if [[ -d $waybar ]]; then
  alias waybar="nvim $waybar"
fi

if [[ -d $dotfiles ]]; then
  alias dotfiles="nvim $dotfiles"
fi

if [[ -d $dev ]]; then
  alias dev="cd $dev"
fi
