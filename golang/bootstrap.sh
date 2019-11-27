#!/bin/bash

# This script will install
# - golang-go
# - powerline-go

sudo apt install golang-go

printf "\nBootstraping powerline-go..."
go get -u github.com/justjanne/powerline-go
printf "...Done.\n"