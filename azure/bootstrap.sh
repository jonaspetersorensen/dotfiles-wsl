#!/bin/bash

# This script will install
# - azcli

echo ""
echo "Starting install of azure tooling"
echo ""

echo "Installing prerequisite packages..."
sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

echo "Installing MS signing key..."
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

echo "Adding azure-cli repo..."
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

echo "Installing azure-cli package..."
sudo apt-get update
sudo apt-get install azure-cli

echo ""
echo "Install of azure tooling done."