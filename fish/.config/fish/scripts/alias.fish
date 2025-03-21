set -U dev $HOME/software-development
set -U dotfiles $HOME/dotfiles

if [ -d $dev ]
    alias dev="cd $dev"
end

if [ -d $dotfiles ]
    alias dotfiles="cd '$dotfiles'"
end

if [ -e /bin/docker ]
    alias docker-compose="docker compose"
    alias dc="docker compose"
    alias dk="docker"
end

if [ -e /bin/lsd ]
    alias ls="lsd"
end

if [ -e /bin/nvim ]
    alias vim="nvim"
end

if [ -e /bin/lazygit ]
    alias lg="lazygit"
end

if [ -e /bin/lazydocker ]
    alias ld="lazydocker"
end
