# Headless WSL + ROS + GzWeb

WSL + x-server can work quite nice, but it requires some twidling.  
Gazebo native client is a brutal cpu hog, so a better option to display the simulation is to use the Gazebo web client, [GzWeb](http://gazebosim.org/gzweb.html)

Now we can use wsl in it's normal headless mode and let it host a webserver, and then view the simulation in a browser from the windows side.

## Installation

### WSL

1. Be sure to be on Windows build 1809 or later  
   You can use windows update assistant to force an upgrade to one of the major builds.  
   If you do force an upgrade then make sure to run windows update after the upgrade has been completed.  

1. Use Ubuntu 18.04  
   For installation see [Windows Subsystem for Linux Documentation](https://msdn.microsoft.com/en-us/commandline/wsl/about)  
   Then have a look at how to set up ssh and a nice terminal in the [repo readme](../README.md)  


### ROS

1. Install ROS distro  
   Follow the official instructions for how to install [Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu).  
   Choose to install the feature _Desktop-Full_ to include Gazebo 9 (the simulator) with all the libraries you will need.  

1. Configure ROS environment  
   Follow the official [instructions](http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment)  

1. Add ROS environment and workspace configuration to your shell session script  
   Add the following to `.zshrc` to ensure ROS environment and workspace are ready for each new session:  
   ```
   # Run ROS environment and workspace setup
   source /opt/ros/melodic/setup.zsh
   source ~/catkin_ws/devel/setup.zsh
   ```
   Note that I have chosen to use the `zsh` setup, there are similar files for `bash` etc.  


### GzWeb

Follow the official [GzWeb installation instructions](http://gazebosim.org/gzweb.htm) with some exceptions:

1. *Exception - Do not install any Gazebo version*  
   You have everything you need if you installed ROS with the _Desktop-Full_ feature.

1. *Exception - The `nodejs npm nodejs-legacy` dependency installation*    
   You might want to control the nodejs installation using a node virtual environment manager like `nvm` or `n`.  
   I went with `n` as there supposedly are some issues with nvm and Gazebo. You can have a look at my install of nodejs and related tooling in the [../nodejs/bootstrap.sh](../nodejs/bootstrap.sh) script.  

