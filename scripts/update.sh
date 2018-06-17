#!/bin/bash

# PURPOSE
# Run update and linking of dotfiles.

# DEPENDENCIES
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/ui.sh"



function update::run()
{
        local step
        local repoPath

	# Path must be absolute to keep symlinks intact
        repoPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../"

        step="Step 1"
        ui::print::section_start "${step}: Refresh packages - In progress..."
        sudo add-apt-repository ppa:git-core/ppa
        sudo apt-get -y update
        sudo apt-get -y upgrade
        sudo apt-get -y dist-upgrade
        sudo apt autoremove
        ui::print::section_end "${step}: Done!"
       

        step="Step 2"
        ui::print::section_start "${step}: Link dotfiles - In progress..."
        ln -sf "$DIR/.completion_list" ~/.completion_list
        ln -sf "$DIR/.zshrc" ~/.zshrc
        ln -sf "$DIR/.bashrc" ~/.bashrc
        ln -sf "$DIR/.nanorc" ~/.nanorc
        ui::print::section_end "${step}: Done!"

}
