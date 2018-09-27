#!/bin/bash

# PURPOSE
# Run installation of all the goodies in ideally a fresh environment.

# DEPENDENCIES
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/ui.sh"
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/update.sh"
. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/golang.sh"



function install::run()
{
	local TERRAFORM_VERSION
	local KUBE_LATEST_VERSION
	
	TERRAFORM_VERSION=0.11.7
	KUBE_LATEST_VERSION="v1.10.2"

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
	sudo apt -qq install git wget tar xz-utils gzip p7zip-full unzip recode apt-transport-https jq
    ui::print::section_end "${step}: Done!"


	step="Step 3"
    ui::print::section_start "${step}: Install zsh - In progress..."
	if [ ! -e ~/.zshrc ]; then
	    sudo apt-get install zsh
		#ui::print::highlight "Installation done. Restart your session, then run install again to continue."
		#exit 0
	else
		echo "zsh allready installed."
	fi
	
	if [ ! -d ~/.oh-my-zsh ]; then
		echo "Installing oh-my-zsh..."
		sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		echo "A pretty oh-my-zsh requires powerline fonts - installing..."
		sudo apt install fonts-powerline
		#ui::print::highlight "Installation done. Restart your session, then run install again to continue."
        exit 0
	else
		echo "oh-my-zsh allready installed."
	fi

    echo "Install zsh-dircolors-solarized as Oh-My_Zsh plugin..."
    # See https://github.com/joel-porquet/zsh-dircolors-solarized for full instructions
    # Note - activation of these scripts are already configured in .zshrc, we just need to download the resources
    git clone --recursive git://github.com/joel-porquet/zsh-dircolors-solarized $ZSH_CUSTOM/plugins/zsh-dircolors-solarized 
    ui::print::section_end "${step}: Done!"


	step="Step 4"
    ui::print::section_start "${step}: Installing python stuff - In progress..."
	pip3 install virtualenv --user
	ui::print::section_end "${step}: Done!"


	step="Step 5"
    ui::print::section_start "${step}: Installing javascript dev tooling - In progress..."
    
	# first install nvm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
	# then start it
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	echo "Testing nvm --version"
	nvm --version
	# now we can continue to install nodejs and related tools
	nvm install node --reinstall-packages-from=node
	nvm use node
	nvm alias default node
	
	# Install npm tools"
	npm install -g yo less yarn
    ui::print::section_end "${step}: Done!"

    
	step="Step 6"
    ui::print::section_start "${step}: Install golang - In progress..."
    golang::install
    ui::print:section_end "${step}: Done!"


	step="Step 7"
    ui::print::section_start "${step}: Install az cli and related tooling - In progress..."
    AZ_REPO=$(lsb_release -cs)
        echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
        sudo tee /etc/apt/sources.list.d/azure-cli.list
    curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo apt-get install azure-cli
    az aks install-cli
    ui::print::section_end "${step}: Done!"
    
	
    step="Step 8"
    ui::print::section_start "${step}: Install kubernetes tooling - In progress..."
    echo "Installing kubectl ${KUBE_LATEST_VERSION}"
    wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl
    chmod +x /usr/local/bin/kubectl
    
    echo "Installing helm ${HELM_VERSION}"
    wget -q http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm
    ui::print:section_end "${step}: Done!"    


	step="Step 9"
    ui::print::section_start "${step}: Install terraform - In progress..."
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin
	rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    ui::print::section_end "${step}: Done!"

	
    ui::print::job_end "Installation done. Moving over to updates."
	update::run

}
