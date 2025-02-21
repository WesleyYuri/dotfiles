if status is-interactive
	starship init fish | source
	fish_add_path $HOME/.local/bin

	# ASDF configuration code
	if test -z $ASDF_DATA_DIR
		set _asdf_shims "$HOME/.asdf/shims"
	else
		set _asdf_shims "$ASDF_DATA_DIR/shims"
	end

	# Do not use fish_add_path (added in Fish 3.2) because it
	# potentially changes the order of items in PATH
	if not contains $_asdf_shims $PATH
		set -gx --prepend PATH $_asdf_shims
	end
	set --erase _asdf_shims

	source ~/.config/fish/scripts/alias.fish

	function reload
		source $HOME/.config/fish/config.fish
		tmux source-file ~/.tmux.conf
	end
  
 #  function containers_start
 #    docker run -d --rm -p 3306:3306 -v mariadb:/var/lib/mysql --name mariadb mariadb
	# end

	# Initialize session of tmux
	if [ -z "$TMUX" ]; tmux; end
end

fish_add_path /home/yuri/.spicetify
