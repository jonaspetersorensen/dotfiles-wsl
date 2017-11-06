echo "apt update..."
sudo apt -qq update
echo "✔ update done!"

sudo apt -qq install zsh git
echo "✔ base packages are installed"

git pull
echo "✔ dotfiles are up to date"

# Start ssh-agent and set zsh as default
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.bashrc ~/.bashrc
echo "✔ zsh as default shell"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -sf $(pwd)/.gitconfig ~/.gitconfig
echo "✔ .gitconfig symlinked"

#  install dev tools
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt -qq install nodejs
sudo apt -qq install npm
sudo apt -qq install python-pip
echo "✔ apt dev tools installed"
