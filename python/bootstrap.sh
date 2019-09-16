#!/bin/bash

# This script will install python tooling

echo ""
echo "Starting install of python tooling"
echo ""

#echo "Python 2 stuff..."
#python2 --version
#sudo apt install python-pip
#pip --version

echo ""
echo "Python 3 stuff..."
python3 --version
sudo apt install python3-pip
pip3 --version

echo ""
#echo "Install virtualenv..."
#pip3 install virtualenv --user
echo "Install venv..."
sudo apt-get install -y python3-venv

echo ""
echo "Install of python tooling done."
