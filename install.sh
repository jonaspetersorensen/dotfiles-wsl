echo "apt update..."
sudo apt -qq update
echo "✔ update done!"

sudo apt -qq install zsh git
echo "✔ base packages are installed"

git pull
echo "✔ dotfiles are up to date"

# ln -sf $(pwd)/bashrc ~/.bashrc
cp .bashrc ~/
echo "✔ zsh as default shell"
