# Log text separator
read -d '' separator <<- EOF


EOF

# Start work
echo "$separator"
echo "Run apt update, upgrade and remove..."
echo "$separator"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt autoremove
echo "$separator"
echo "✔ apt work done!"
echo "$separator"

echo "Checking base packages..."
echo "$separator"
sudo apt -qq install zsh git
echo "$separator"
echo "✔ base packages are installed"
echo "$separator"

echo "Checking dotfiles source..."
echo "$separator"
git pull
echo "$separator"
echo "✔ dotfiles source is up to date"
echo "$separator"

# Start ssh-agent and set zsh as default
echo "Checking shell..."
echo "$separator"
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.bashrc ~/.bashrc
echo "✔ zsh as default shell"
echo "$separator"

# Install oh-my-zsh
echo "Checking oh-my-zsh..."
echo "$separator"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "$separator"
echo "✔ oh-my-zsh installed"
echo "$separator"

# Configure git
echo "Checking git..."
ln -sf $(pwd)/.gitconfig ~/.gitconfig
echo "✔ .gitconfig symlinked"
echo "$separator"

# install dev tools
echo "$separator"
echo "Checking dev tools..."
echo "$separator"
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
echo "$separator"
echo "✔ dev tools installed"
echo "$separator"

# Install npm tools"
echo "Checking npm dev tools..."
echo "$separator"
npm install -g yo less yarn
echo "$separator"
echo "✔ npm -g dev tools installed"
echo "$separator"
