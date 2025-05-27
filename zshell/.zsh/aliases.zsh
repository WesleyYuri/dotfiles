export EDITOR="vscode"

dev=~/Development
dotfiles=~/Dotfiles

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
