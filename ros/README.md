# How to ROS in WSL

Two options:
- [Headless](./headless.md) (recommended)
- [Desktop](./desktop.md)

_Headless_ do not require any fancy display configuration in WSL as the simulator output will be made available via a web client which you can then browse from the window side.  
_Desktop_ is a full x-server setup which can work quite nice in WSL, but the Gazebo client is brutal...

## Multiple distros and workspaces
Since I use multiple ROS distros and workspaces I had to organize what run where somehow without bloating my shared `.zshrc` file,  
and so I moved all ROS setups out to a separate setup file, see [ros_env_setup_template.sh](../ros_env_setup_template.sh)