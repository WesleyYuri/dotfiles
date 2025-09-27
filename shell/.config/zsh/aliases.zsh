dotfiles_dir="$HOME/.dotfiles"

if [[ -d $dotfiles_dir ]]; then
  alias dotconfig="cd $dotfiles_dir && nvim ."
fi

