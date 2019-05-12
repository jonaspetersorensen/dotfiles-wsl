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
        repoPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"

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
        ln -sf "$repoPath/.zshrc" ~/.zshrc
        ln -sf "$repoPath/.zsh-dircolors.config" ~/.zsh-dircolors.config
        ln -sf "$repoPath/.bashrc" ~/.bashrc
        ln -sf "$repoPath/.nanorc" ~/.nanorc
        ln -sf "$repoPath/.gitconfig" ~/.gitconfig
        ln -sf "$repoPath/.tmux.conf" ~/.tmux.conf
        ui::print::section_end "${step}: Done!"

}
