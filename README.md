# dotfiles-wsl
My horrible configuration files for Ubuntu on Windows, and an even worse attempt at creating an installer for mucking it all up again.

## Usage

Clone repo and then run the install script to install goodies and symlink some dotfiles.

```
$ git clone https://github.com/jonaspetersorensen/dotfiles-wsl.git ~/.dotfiles  
$ bash ~/.dotfiles/install.sh
```  
  
You can keep up to date by re-run `install.sh` as it will `pull` the repo each time.  
  
## SSH  

WSL and persisting ssh keys can be a pain.  
My current solution is to configure `~/.ssh/config` as shown in repo/ssh/config example.
  
## HyperJs

The terminal lives in windows, and creating symlinks to files in windows can produce ...fascinating headaches.  
For now this dotfile will have to be manually copied to `/mnt/c/Users/<username>`.

## Resources

###### Official documentation
- [Windows Subsystem for Linux Documentation](https://msdn.microsoft.com/en-us/commandline/wsl/about)

###### Setup
- [Bash On Ubuntu On Windows](https://github.com/abergs/ubuntuonwindows)
- [How to Install zsh and Oh My Zsh in Windows 10](https://www.maketecheasier.com/install-zsh-and-oh-my-zsh-windows10/)

###### Examples
- [Living inside the updated windows subsystem for linux](https://taoofmac.com/space/blog/2017/05/07/1920)
- [dotfiles-win](https://github.com/jieverson/dotfiles-win)

## Odd bits  

###### Symlinks  
Interesting work in progress on MS side to make WSL symlinks work fine in both linux and windows  
[Symlinks on the mounted Windows directories are not compatible with native](https://github.com/Microsoft/WSL/issues/353)

###### Yarn install fail  
Fix is working its way thru the windows update release process,
[`yarn install` fails inside /mnt with EINVAL for lstat during step 3](https://github.com/Microsoft/WSL/issues/2448#issuecomment-342224944)
