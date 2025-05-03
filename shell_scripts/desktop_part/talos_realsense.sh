#!/bin/bash
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/podman/bin:$PATH
xhost +si:localuser:$USER


## Running shell script with joy teleoperation + rviz in ubuntu 20.04 distrobox image
REALSENSE_RVIZ_CONFIG=/home/deck/beyond_SteamDeck/configs/rviz/realsense_config.rviz
SCRIPT_PATH=/home/deck/beyond_SteamDeck/shell_scripts/ros_part/rviz.sh
distrobox enter ubuntu-20-04 -- ${SCRIPT_PATH} ${REALSENSE_RVIZ_CONFIG}

## Killing terminal left after the script finished executing (needed only when the .desktop file has option Terminal set to True)
# kill -9 $PPID