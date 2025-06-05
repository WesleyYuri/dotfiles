ensure_package vim -s
ensure_package neovim -b nvim -s

[ -e /bin/nvim ] && alias vim="nvim"