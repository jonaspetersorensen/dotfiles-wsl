# WSL + ROS + Gazebo

To get ROS running in WSL along with the simulator using the desktop client then we need install and configure the following components

- WSL
- X Server
- ROS
- Gazebo

Be warned - the Gazebo client will grab all the cpu it can get.  
The [headless](./headless.md) setup seems to be much nicer to use.  

Thanks to [jbohren-hbr](https://github.com/Microsoft/WSL/issues/3368#issuecomment-414717437) for getting me started on how to get this all up and running.  

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
   [Install Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu), choose to install _Desktop-Full_ to include Gazebo 9 (the simulator).  

1. Configure ROS environment  
   [Configure ROS environment](http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment)  

1. Add ROS environment and workspace configuration to your shell session script  
   Add the following to `.zshrc` to ensure ROS environment and workspace are ready for each new session:  
   ```
   # Run ROS environment and workspace setup
   source /opt/ros/melodic/setup.zsh
   source ~/catkin_ws/devel/setup.zsh
   ```
   Note that I have chosen to use the `zsh` setup, there are similar files for `bash` etc.  


### X Server

See ["WSL and X-Server"](../x-server.md)

### Gazebo

The default simulator for ROS.  

A fair warning, the Gazebo desktop client *really* likes cpu and it will gobble up everything.  
This is a [known issue](https://bitbucket.org/osrf/gazebo/issues/1560/gazebo-causes-high-cpu) in Gazebo as it seems to have no limit on refresh rate.  
When you use VcXsrv as the x-server then there is an option to use native opengl when you boot it up on the windows side. You must leave this setting off, or Gazebo might do weird things or simply just black out.

1. (Optional) - Install gazebo 9 with bootstrap script  

   Skip this step if you installed ROS with the Desktop-Full package.

   ```
   curl -sSL http://get.gazebosim.org | sh
   ```

1. Run gazebo
   ```
   gazebo --verbose
   ```

    Expected result is 

    ![Gazebo window](./gazebo-success.png)

    ```
    Gazebo multi-robot simulator, version 9.3.1
    Copyright (C) 2012 Open Source Robotics Foundation.
    Released under the Apache 2 License.
    http://gazebosim.org

    [Msg] Waiting for master.
    Gazebo multi-robot simulator, version 9.3.1
    Copyright (C) 2012 Open Source Robotics Foundation.
    Released under the Apache 2 License.
    http://gazebosim.org

    [Msg] Connected to gazebo master @ http://127.0.0.1:11345
    [Msg] Publicized address: 127.0.0.1
    [Msg] Waiting for master.
    [Msg] Connected to gazebo master @ http://127.0.0.1:11345
    [Msg] Publicized address: 127.0.0.1
    ```

    Please note the last line, `[Msg] Publicized address: 127.0.0.1`  
    This has to be a valid interface according to `ipconfig`.  
    In previous builds of gazebo you had to set the env `GAZEBO_IP` equal to the value of env `DISPLAY` to force it to use the correct interface, as gazebo would grab a possible inactive interface by default. This has now been fixed.

#### Test Gazebo with ROS integration

Follow steps as described in http://gazebosim.org/tutorials?tut=ros_installing#TestingGazebowithROSIntegration