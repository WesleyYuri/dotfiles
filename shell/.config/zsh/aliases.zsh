# env props
export hyprconfigs="$HOME/.config/hypr"
export waybar_dir="$HOME/.config/waybar"

export dotfiles="$HOME/Dotfiles"
export dev="$HOME/Development"

[[ -e /bin/lsd ]] && alias ls="lsd"

[[ -e /bin/lazydocker ]] && alias ld="lazydocker"

if [[ -d $hyprconfigs ]]; then
  alias hyprconfigs="nvim $hyprconfigs"
fi

if [[ -d $waybar_dir ]]; then
  alias waybarconf="nvim $waybar_dir"
fi

if [[ -d $dotfiles ]]; then
  alias dotfiles="nvim $dotfiles"
fi

if [[ -d $dev ]]; then
  alias dev="cd $dev"
fi
