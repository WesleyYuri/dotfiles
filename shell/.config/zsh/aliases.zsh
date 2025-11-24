dotfiles_dir="$HOME/.dotfiles"
dev_dir="$HOME/Development"
waybar_dir="$HOME/.config/waybar"
hypr_dir="$HOME/.config/hypr"

if [[ -d $dotfiles_dir ]]; then
  alias dotconfig="cd $dotfiles_dir && nvim ."
fi

if [[ -d $dev_dir ]]; then
  alias dev="cd $dev_dir"
fi

if [[ -d $hypr_dir ]]; then
  alias hyprconfig="cd $hypr_dir && nvim ."
fi

if [[ -d $waybar_dir ]]; then
  alias waybarconfig="cd $waybar_dir && nvim ."
fi

if [[ -e /usr/bin/lsd ]]; then
  alias ls="lsd"
fi

