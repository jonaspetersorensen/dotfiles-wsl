#!/bin/bash

# PURPOSE
# Provide a ros environment config per dev machine so that the shared .zshrc is not bloated.
# Upon dotfiles installation this file should be copied (not linked) to $HOME and then configured for how the ROS
# environment should be setup on that particular machine.
# The shared .zshrc will then call this file if it exists in $HOME.

# DISTRO
# Melodic
#source /opt/ros/melodic/setup.zsh
#echo "ROS Melodic is ready."

# Kinetic
#source /opt/ros/kinetic/setup.zsh
#echo "ROS Kinetic is ready."

# WORKSPACE
# Default
#source "$HOME/catkin_ws/devel/setup.zsh"
#echo "ROS default workspace is ready."

# ros_rbx1_ws
#source "$HOME/ros_rbx1_ws/devel/setup.zsh"
#echo "ROS workspace \"ros_rbx1_ws\" is ready."