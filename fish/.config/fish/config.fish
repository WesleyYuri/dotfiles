if status is-interactive
	starship init fish | source
	fish_add_path $HOME/.asdf/installs/php/8.3.12/.composer/vendor/bin
	fish_add_path $HOME/.local/bin
	. ~/.asdf/plugins/java/set-java-home.fish

	source ~/.asdf/asdf.fish
	source ~/.asdf/plugins/golang/set-env.fish
	source ~/.config/fish/scripts/alias.fish

	function reload
		source $HOME/.config/fish/config.fish
	end
  
  # Initialize session of tmux
	if [ -z "$TMUX" ]; tmux; end
end
