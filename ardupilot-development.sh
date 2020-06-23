#!/bin/bash

# PURPOSE
# Provide a ardupilot environment config per dev machine so that the shared .zshrc is not bloated.
# Upon dotfiles installation this file should be copied (not linked) to $HOME and then configured for how the ardupilot
# environment should be setup on that particular machine.
# The shared .zshrc will then call this file if it exists in $HOME.

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

ARDUPILOT_PATH="$HOME/dev/equinor/kitchen-ardupilot/ardupilot"

if [ ${RELEASE_CODENAME} == 'focal' ]; then
    source "$ARDUPILOT_PATH/Tools/completion/completion.zsh"
else
    export PATH=/opt/gcc-arm-none-eabi-6-2017-q2-update/bin:$PATH
    export PATH="$ARDUPILOT_PATH/Tools/autotest:$PATH"
fi
