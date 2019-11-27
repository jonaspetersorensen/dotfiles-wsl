#!/bin/bash

# This script will remove
# - golang-go
# - powerline-go

# Find powerline, then remove it
printf "Removing powerline-go..."
test -d $GOROOT/src/powerline-go && rm -r $GOROOT/src/powerline-go
test -d $GOPATH/src/powerline-go && rm -r $GOPATH/src/powerline-go
printf "...Done.\n"

# Finally remove golang
echo "Removing golang-go..."
sudo apt remove golang-go
echo "...Done!"