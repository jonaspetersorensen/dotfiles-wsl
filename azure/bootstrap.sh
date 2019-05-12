#!/bin/bash

# This script will install
# - azcli

echo ""
echo "Starting install of azure tooling"
echo ""

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
sudo tee /etc/apt/sources.list.d/azure-cli.list
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-get install azure-cli 

echo ""
echo "Install of azure tooling done."