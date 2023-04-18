#!/bin/bash
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/podman/bin:$PATH
xhost +si:localuser:$USER


## Running florence (virtual keyboard) in ubuntu 20.04 distrobox image
KEYBOARD_CONFIG=@@REPO_PATH@@/configs/florence.conf
distrobox enter ubuntu-20-04 -- florence -u ${KEYBOARD_CONFIG}

## Killing terminal left after the script finished executing (needed only when the .desktop file has option Terminal set to True)
# kill -9 $PPID