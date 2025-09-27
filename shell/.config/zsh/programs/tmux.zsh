# Initialize session of tmux
if  [[ -x /bin/tmux ]] && [[ -z "$TMUX" ]] && [[ $(tty) == /dev/pts/* ]]; then
  tmux attach-session || tmux
fi
