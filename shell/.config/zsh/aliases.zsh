# env props
export dotfiles_dir="$HOME/Dotfiles"
export hypr_dir="$HOME/.config/hypr"
export waybar_dir="$HOME/.config/waybar"

export dev="$HOME/Development"

[[ -e /bin/lsd ]] && alias ls="lsd"

[[ -e /bin/lazydocker ]] && alias ld="lazydocker"

if [[ -d $hypr_dir ]]; then
  alias hyprconfig="nvim $hypr_dir"
fi

if [[ -d $waybar_dir ]]; then
  alias waybarconfig="nvim $waybar_dir"
fi

if [[ -d $dotfiles_dir ]]; then
  alias dotconfig="nvim $dotfiles_dir"
fi

if [[ -d $dev ]]; then
  alias dev="cd $dev"
fi
