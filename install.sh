. $(dirname "$0")/scripts/colors.lib
. $(dirname "$0")/scripts/common.lib

# Start work
printStart "Run apt update, upgrade and remove..."
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt autoremove
printEnd "✔ apt work done!"

printStart "Checking base packages..."
sudo apt -qq install zsh git
printEnd "✔ base packages are installed"

printStart "Checking dotfiles source..."
git pull
printEnd "✔ dotfiles source is up to date"

# Start ssh-agent and set zsh as default
printStart "Checking shell..."
ln -sf $(dirname "$0")/.zshrc ~/.zshrc
ln -sf $(dirname "$0")/.bashrc ~/.bashrc
printEnd "✔ zsh as default shell"

# Install oh-my-zsh
printStart "Checking oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printEnd "✔ oh-my-zsh installed"

# Configure git
printStart "Checking git..."
ln -sf $(dirname "$0")/.gitconfig ~/.gitconfig
printEnd "✔ .gitconfig symlinked"

# install dev tools
printStart "Checking dev tools..."
# first install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
# then start it
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
echo "Testing nvm --version"
nvm --version
# now we can continue to install nodejs and related tools
nvm install --lts=carbon
nvm use --lts=carbon
nvm alias default lts/carbon
printEnd "✔ dev tools installed"

# Install npm tools"
printStart "Checking npm dev tools..."
npm install -g yo less yarn
printEnd "✔ npm -g dev tools installed"
