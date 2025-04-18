#!/bin/bash

# Set error handling
set -e

echo "Installing dependencies for talos_teleop package..."

# Check if ROS is sourced by checking ROS_DISTRO environment variable
if [ -z "$ROS_DISTRO" ]; then
    echo "ROS environment is not sourced. Sourcing your ROS setup.bash file first."
    source /opt/ros/noetic/setup.bash
fi

# Install apt dependencies
echo "Installing required ROS packages..."
sudo apt-get update
sudo apt-get install -y \
    ros-${ROS_DISTRO}-joy \
    ros-${ROS_DISTRO}-teleop-twist-joy \
    ros-${ROS_DISTRO}-teleop-twist-keyboard \
    ros-${ROS_DISTRO}-rviz \
    ros-${ROS_DISTRO}-rqt-image-view \
    xterm

# Check for Florence virtual keyboard (used in florence.sh)
if ! command -v florence &> /dev/null; then
    echo "Installing Florence virtual keyboard..."
    sudo apt-get install -y florence
fi

# Install additional dependencies for keyboard teleoperation
if ! command -v xterm &> /dev/null; then
    echo "Installing xterm for keyboard teleoperation..."
    sudo apt-get install -y xterm
fi

echo "Dependencies installation complete!"
echo "You can now build the talos_teleop package with 'catkin_make' or 'catkin build'"