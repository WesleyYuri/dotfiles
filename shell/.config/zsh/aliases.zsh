dotfiles_dir="$HOME/.dotfiles"
waybar_dir="$HOME/.config/waybar"
hypr_dir="$HOME/.config/hypr"

if [[ -d $dotfiles_dir ]]; then
  alias dotconfig="cd $dotfiles_dir && nvim ."
fi

if [[ -d $hypr_dir ]]; then
  alias hyprconfig="cd $hypr_dir && nvim ."
fi

if [[ -d $waybar_dir ]]; then
  alias waybarconfig="cd $waybar_dir && nvim ."
fi
