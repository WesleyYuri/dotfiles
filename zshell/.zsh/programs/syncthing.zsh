ensure_package syncthing -s

if [ -e /bin/syncthing ]; then
  syncthing-background() {
    syncthing >/dev/null 2>&1 &
    disown
  }

  syncthing-shutdown(){
    kill syncthing
  }
fi