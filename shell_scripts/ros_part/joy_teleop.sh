#!/bin/bash
export ROS_MASTER_URI=http://master.lan:11311
export ROS_IP=$(hostname -I | xargs)
source /opt/ros/noetic/setup.bash

## Launching teleoperation nodes with custom config for steam deck axes mapping
CONFIG_FILE=@@REPO_PATH@@/configs/steam_deck_config.yaml
roslaunch leo_teleop joy_teleop.launch joy_config_file:=${CONFIG_FILE} &
LAUNCH_BACK_PID=$!

## Running image view in rqt
rqt_image_view &
RQT_BACK_PID=$!

## Waiting for RQT close
wait $RQT_BACK_PID
echo "RQT closed"

## Killing the node responsible for joy controll
echo "Killing launch nodes"
kill $LAUNCH_BACK_PID

## Without the kill command on PID we need to kill the nodes manually
#rosnode kill /joy_node
#rosnode kill /joy_teleop_node