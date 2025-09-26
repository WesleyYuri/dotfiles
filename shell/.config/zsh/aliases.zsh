# Sdk props
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# env props
export dotfiles_dir="$HOME/Dotfiles"
export hypr_dir="$HOME/.config/hypr"
export waybar_dir="$HOME/.config/waybar"
export dev_dir="$HOME/Development"

[[ -e /bin/lsd ]] && alias ls="lsd"

[[ -e /bin/lazydocker ]] && alias ld="lazydocker"

if [[ -d $hypr_dir ]]; then
  alias hyprconfig="cd $hypr_dir && nvim $hypr_dir"
fi

if [[ -d $waybar_dir ]]; then
  alias waybarconfig="cd $waybar_dir && nvim $waybar_dir"
fi

if [[ -d $dotfiles_dir ]]; then
  alias dotconfig="cd $dotfiles_dir && nvim $dotfiles_dir"
fi

if [[ -d $dev_dir ]]; then
  alias dev="cd $dev_dir"
fi
