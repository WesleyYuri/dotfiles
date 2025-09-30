export PATH="$PATH:$HOME/.local/share/scripts:$HOME/.spicetify"
# export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share/scripts"

# if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
#     exec Hyprland
# fi
if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
  if uwsm check may-start; then
      exec uwsm start hyprland-uwsm.desktop
  fi
fi
