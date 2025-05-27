ensure_package lsd -s

if [[ -e /bin/lsd ]]; then
  alias ls="lsd"
fi
