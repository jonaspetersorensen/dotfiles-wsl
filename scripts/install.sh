#!/bin/bash

# PURPOSE
# Run installation of all the goodies in ideally a fresh environment.

# DEPENDENCIES
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/ui.sh"
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/update.sh"




function install::run()
{
	local step
	local repoPath

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
    ui::print::section_start "${step}: Install base utils - In progress..."
	sudo apt -qq install git wget tar xz-utils gzip p7zip-full unzip recode apt-transport-https jq yq build-essential python3-pip
    ui::print::section_end "${step}: Done!"


	step="Step 3"
    ui::print::section_start "${step}: Install zsh - In progress..."
	if [ ! -e ~/.zshrc ]; then
	    sudo apt-get install zsh
		ui::print::highlight "ZSH installation done. Restart your session, then run install again to continue."
		exit 0
	else
		echo "zsh allready installed."
	fi

	if [ ! -d ~/.oh-my-zsh ]; then
		echo "Installing oh-my-zsh..."
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		echo "A pretty oh-my-zsh requires powerline fonts - installing..."
		sudo apt install fonts-powerline
		ui::print::highlight "oh-my-zsh installation done. Restart your session, then run install again to continue."
        exit 0
	else
		echo "oh-my-zsh allready installed."
	fi

    echo "Install zsh-dircolors-solarized as Oh-My_Zsh plugin..."
    # See https://github.com/joel-porquet/zsh-dircolors-solarized for full instructions
    # Note - activation of these scripts are already configured in .zshrc, we just need to download the resources
    git clone --recursive git://github.com/joel-porquet/zsh-dircolors-solarized $ZSH_CUSTOM/plugins/zsh-dircolors-solarized 
    ui::print::section_end "${step}: Done!"


    ui::print::job_end "Installation done. Moving over to updates."
	update::run

}
