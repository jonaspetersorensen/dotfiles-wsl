#!/bin/bash

# WSL does not pick up on network changes in win10 when win10 use vpn.
# The workaround is to manually set which dns WSL should use each time we start vpn in win10.
# We'll keep the "autogenerate config" setting in the config so WSL will reset it when restarting.

sudo cp win10-vpn-resolv.conf /etc/resolv.conf
