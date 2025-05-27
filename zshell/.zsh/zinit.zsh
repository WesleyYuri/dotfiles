# Source all config files
config_dir=~/.zsh/config
for script in $(find "$config_dir"/ -type f); do
  . "$script"
done

# Source all program files
programs_dir=~/.zsh/programs
for script in $(find "$programs_dir"/ -type f); do
  . "$script"
done