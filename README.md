# dotfiles-wsl
My horrible configuration files for Ubuntu on Windows, and an even worse attempt at creating an installer for mucking it all up again.

## Usage

Clone repo and then run the install script to install my prefeered environment and symlink all dotfiles.

```
$ git clone https://github.com/jonaspetersorensen/dotfiles-wsl.git ~/.dotfiles  
$ bash ~/.dotfiles/install.sh
```  
  
You can keep up to date by simply re-run `install.sh` as it will `pull` the repo each time.  
  
## SSH  

WSL and persisting ssh keys can be a pain. My current solution is to configure ~/.ssh/config as shown in repo/ssh/config example.
