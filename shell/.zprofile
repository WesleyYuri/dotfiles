# export PATH="$PATH:$HOME/.local/share/scripts"
# export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/scripts"

if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    exec Hyprland
fi
