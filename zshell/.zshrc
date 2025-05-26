USE_POWERLINE="true"
HAS_WIDECHARS="false"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Initialize session of tmux
if [[ -z "$TMUX" ]]; then
  tmux
fi

scriptsFolder=~/.zsh
for script in "$scriptsFolder"/*; do
  source "$scriptsFolder"/$(basename "$script")
done