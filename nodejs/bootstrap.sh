#!/bin/bash

# This script will install
# - "n": nodejs version manager
# - "nodejs"

# Why not nvm? Too much trouble with ROS, gazebo etc.

# Docs
# n, https://github.com/tj/n
# n-install, https://github.com/mklement0/n-install

echo ""
echo "Starting install of nodejs and version manager"
echo ""

# First install the version manager "n" using third party installer
curl -L https://git.io/n-install | bash

source ~/.zshrc

# Then install nodejs using n
n lts

# Lets add some default tooling as well
npm install -g yo less yarn

echo ""
echo "Install of nodejs and version manager done."