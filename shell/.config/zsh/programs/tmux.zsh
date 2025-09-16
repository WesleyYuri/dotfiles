# Initialize session of tmux
if [[ -z "$TMUX" ]]; then
  tmux attach-session || tmux
fi
