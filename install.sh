DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "${DIR}/scripts/colors.lib"
. "${DIR}/scripts/common.lib"

# Start work
printStart "Run apt update, upgrade and remove..."
# Add git-core so we can get the latest git version
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt autoremove
printEnd "✔ apt work done!"

printStart "Checking base packages..."
# TODO: move zsh into separate install script
sudo apt -qq install zsh git wget tar xz-utils gzip p7zip-full unzip
printEnd "✔ base packages are installed"

# Configure git
printStart "Checking git..."
ln -sf "$DIR/.gitconfig" ~/.gitconfig
printEnd "✔ .gitconfig symlinked"

printStart "Checking dotfiles source..."
git pull
printEnd "✔ dotfiles source is up to date"

# Start ssh-agent and set zsh as default
printStart "Checking shell..."
# Add custom bash completion list (zsh will run it in .zshrc)
#[ ! -f ~/.completion_list ] && touch ~/.completion_list 
ln -sf "$DIR/.completion_list" ~/.completion_list
ln -sf "$DIR/.zshrc" ~/.zshrc
ln -sf "$DIR/.bashrc" ~/.bashrc
printEnd "✔ zsh as default shell, releveant dotfiles symlinked"

# Install oh-my-zsh
#printStart "Checking oh-my-zsh..."
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#printEnd "✔ oh-my-zsh installed"

# Install oh-my-zsh plugins
printStart "Checking oh-my-zsh plugins..."
# Update dircolors
[ -d ~/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized ] && rm -rf ~/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized
git clone --recursive git://github.com/joel-porquet/zsh-dircolors-solarized ~/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized
ln -sf "$DIR/.zsh-dircolors.config" ~/.zsh-dircolors.config
# dircolors done
printEnd "✔ oh-my-zsh plugins installed"

# Configure custom bin folder
printStart "Checking bin folder..."
[ -d ~/bin ] || mkdir ~/bin
printEnd "✔ bin folder ok."

# Install python modules
printStart "Checking python modules..."
sudo apt-get -y install python3-pip
pip3 install --upgrade pip
printEnd "✔ python modules ok."

# install dev tools
printStart "Checking dev tools..."
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
printEnd "✔ dev tools installed"

# Install npm tools"
printStart "Checking npm dev tools..."
npm install -g yo less yarn
printEnd "✔ npm -g dev tools installed"


# End work
printEnd "Please restart your session to activate changes"
