if status is-interactive
	starship init fish | source
	source ~/.asdf/asdf.fish
	fish_add_path $HOME/.asdf/installs/php/8.3.12/.composer/vendor/bin
	fish_add_path $HOME/.local/bin
	. ~/.asdf/plugins/java/set-java-home.fish
	source ~/.asdf/plugins/golang/set-env.fish

	if [ -d $HOME/software-development ]
		alias dev="cd $HOME/software-development"
	end

	if [ -e /bin/docker ]
		alias docker-compose="docker compose"
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

	if [ -z "$TMUX" ]
		tmux
	end

	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end
