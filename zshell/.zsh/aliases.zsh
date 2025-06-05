export EDITOR="vscode"

dev=~/Development
dotfiles=~/Dotfiles
services=~/Services

if [ -d $dev ]; then
  alias dev="cd $dev"
else
  mkdir ~/Development
fi

if [ -d $dotfiles ]; then
  alias dotfiles="cd '$dotfiles'"
else
  mkdir ~/Dotfiles
fi

if [ -d $services ]; then
  alias services="cd $services"
else
  mkdir ~/Services
fi