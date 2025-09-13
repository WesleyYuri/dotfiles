# init starship theme
eval "$(starship init zsh)"

source $HOME/.zsh/aliases.zsh

# Source all program files
programs_dir=$HOME/.zsh/programs
for script in $(find "$programs_dir"/ -type f); do
  . "$script"
done

