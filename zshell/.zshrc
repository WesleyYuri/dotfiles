USE_POWERLINE="true"
HAS_WIDECHARS="false"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  . /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  . /usr/share/zsh/manjaro-zsh-prompt
fi

# Load helpers
[[ -f ~/.zsh/helpers.zsh ]] && . ~/.zsh/helpers.zsh

# Load programs and config
[[ -f ~/.zsh/zinit.zsh ]] && . ~/.zsh/zinit.zsh

# Load aliases
[[ -f ~/.zsh/aliases.zsh ]] && . ~/.zsh/aliases.zsh

# Initialize session of tmux
if [[ -z "$TMUX" ]]; then
  tmux
fi

neofetch