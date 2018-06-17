# dotfiles-wsl
My horrible configuration files for Ubuntu on Windows, and an even worse attempt at creating an installer for mucking it all up again.

## Usage

Clone repo into subfolder,  
```$ git clone https://github.com/jonaspetersorensen/dotfiles-wsl.git ~/.dotfiles```  

Then run "please install" to install all I(eh, you?) need for happy development,  
```bash ~/.dotfiles/please.sh install```

For just a quick update of all dotfiles then run "please update",  
```bash ~/.dotfiles/please.sh update``

  
## SSH  

WSL and persisting ssh keys can be a pain.  
My current solution is to configure `~/.ssh/config` as shown in repo/ssh/config example.
  
## HyperJs

The terminal lives in windows, and creating symlinks to files in windows can produce ...fascinating headaches.  
For now this dotfile will have to be manually copied to `/mnt/c/Users/<username>`.

## Resources

###### Official documentation
- [Windows Subsystem for Linux Documentation](https://msdn.microsoft.com/en-us/commandline/wsl/about)
- [Microsoft/WSL git repo](https://github.com/Microsoft/WSL/)  
  MS is fairly active in answering issues and providing workarounds when possible until fix is available

###### Setup
- [Bash On Ubuntu On Windows](https://github.com/abergs/ubuntuonwindows)
- [How to Install zsh and Oh My Zsh in Windows 10](https://www.maketecheasier.com/install-zsh-and-oh-my-zsh-windows10/)
- [Guide - Developing on Windows 10 using WSL](https://discourse.roots.io/t/guide-developing-on-windows-10-using-wsl/9380)
- [Shell Scripting Tutorial](https://www.shellscript.sh)

###### Examples
- [Living inside the updated windows subsystem for linux](https://taoofmac.com/space/blog/2017/05/07/1920)
- [dotfiles-win](https://github.com/jieverson/dotfiles-win)

## Odd bits  

###### Symlinks  
Interesting work in progress on MS side to make WSL symlinks work fine in both linux and windows  
[Symlinks on the mounted Windows directories are not compatible with native](https://github.com/Microsoft/WSL/issues/353)
