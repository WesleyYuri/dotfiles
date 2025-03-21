function syncthing-background
    syncthing >/dev/null 2>&1 &
    disown
end

function syncthing-shutdown
    kill syncthing
end
