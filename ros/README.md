# How to ROS in WSL

## Overview

To get ROS running in WSL along with the simulator then we need handle these components

- WSL
- X Server
- ROS
- Gazebo

## WSL

Be sure to be on Windows build 1809 or later.  
You can use windows update assistant to force an upgrade to one of the major builds.  
If do force an upgrade then make sure to run windows update when done.

## X Server

A component that will handle display output from wsl to windows.

Modified instructions from https://github.com/Microsoft/WSL/issues/3368#issuecomment-414717437

### Step 1 - Install [VcXsrv Windows X Server](https://sourceforge.net/projects/vcxsrv/)

### Step 2 - Launch VcXsrv through XLaunch with the following commands  
![VcXsr settings: display](./VcXsrv-settings-display.png)  
![VcXsr settings: client startup](./VcXsrv-settings-client-startup.png)  
![VcXsr settings: extra settings](./VcXsrv-settings-extra-settings.png)  

### Step 3 - Install `xubuntu-desktop` to suppress window manager warnings  
```
sudo apt install xubuntu-desktop
```

### Step 4 - Set env `DISPLAY`  
Two option, go with what works for you  
```
# Option 1 - Gazebo wants this for my installation
export DISPLAY="127.0.0.1:0"

# Option 2 - Did not work for my Gazebo installation
export DISPLAY="localhost:0"

# Avoid
# export DISPLAY=":0"
# means X11 over AF_UNIX on /tmp/.X11-unix/X0, not AF_INET over localhost:6000. This will cause problems in some scenarios.
```

When you got something that works then add the setting to one of your shell session scripts (for example `.bashrc` or `.zshrc`) so it will be set every time you start a new session.

### Step 5 - Install `mesa-utils` to verify 3d acceleration
```
sudo apt install mesa-utils
```

### Step 6 - Run glxgears to verify 3d acceleration
```
glxgears
```
Expected output is a window with some animated gears.


## ROS

Follow installation as described in the distro, [Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)

If you run a Desktop-Full install (the recommended option) then Gazebo v9 (a simulator) should be installed along with it.  
To test if ROS is able to use Gazebo then see [Test Gazebo with ROS integration](#Step-3---Test-Gazebo-with-ROS-integration) down below.

## Gazebo

If Gazebo was not installed along with ROS then you have to install it manually.

### Step 1 - Install gazebo 9 with bootstrap script

```
curl -sSL http://get.gazebosim.org | sh
```

### Step 2 - Run gazebo
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

### Step 3 - Test Gazebo with ROS integration

Follow steps as described in http://gazebosim.org/tutorials?tut=ros_installing#TestingGazebowithROSIntegration
