#!/bin/bash

# Purpose
# Be able to use minikube running in docker on windows from wsl
cp /mnt/c/Users/jonas/.kube/config ~/.kube/minikube.config
export KUBECONFIG=~/.kube/minikube.config
