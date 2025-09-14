export PATH="$PATH:$HOME/.local/share/scripts"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/scripts"

# init starship theme
eval "$(starship init zsh)"

eval "$(/usr/bin/mise activate zsh)"

source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/helpers.zsh

# Source all program files
programs_dir=$HOME/.zsh/programs
for script in $(find "$programs_dir"/ -type f); do
  . "$script"
done

