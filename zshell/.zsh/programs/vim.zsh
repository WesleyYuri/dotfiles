ensure_package vim -s
ensure_package neovim -b nvim -s

if [ -e /bin/nvim ]; then
  alias vim="nvim"
fi