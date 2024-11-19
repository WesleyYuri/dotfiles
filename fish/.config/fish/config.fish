if status is-interactive
	starship init fish | source
	fish_add_path $HOME/.local/bin

	source ~/.asdf/asdf.fish
	source ~/.asdf/plugins/golang/set-env.fish
  source ~/.asdf/plugins/java/set-java-home.fish
	source ~/.config/fish/scripts/alias.fish

	function reload
		source $HOME/.config/fish/config.fish
		tmux source-file ~/.tmux.conf
	end
  
	# Initialize session of tmux
	if [ -z "$TMUX" ]; tmux; end
end

fish_add_path /home/yuri/.spicetify
