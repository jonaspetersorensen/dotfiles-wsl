# dotfiles-wsl
My horrible configuration files for Ubuntu on Windows, and an even worse attempt at creating an installer for mucking it all up again.

## Usage

Clone repo into subfolder,  
```$ git clone https://github.com/jonaspetersorensen/dotfiles-wsl.git ~/.dotfiles```  

Then run "please install" to install all I(eh, you?) need for happy development,  
```bash ~/.dotfiles/please.sh install```

For just a quick update of all dotfiles then run "please update",  
```source ~/.dotfiles/please.sh update```

To install misc tooling then run the `bootstrap.sh` script in the corrensponding tool directory.
  
## SSH  

WSL and persisting ssh keys can be a pain.  
My current solution is to configure `~/.ssh/config` as shown in repo/ssh/config example.


## VPN

WSL does not pick up on network changes when enabling vpn in win10.  
My current workaround is to manually set which dns WSL should use each time I start vpn in win10 as shown in [vpn/win10-vpn-resolv.conf](./vpn/win10-vpn-resolv.conf)  
I then simply copy this file to /etc/resolv.conf each time I enable vpn in windows.
  

## WSL-Terminal

A nice option is wsl-terminal, https://github.com/goreliu/wsl-terminal.  
To set it up to look nice then use the tips found in ["How to setup a nice looking terminal with WSL in Windows 10"](https://medium.com/@Andreas_cmj/how-to-setup-a-nice-looking-terminal-with-wsl-in-windows-10-creators-update-2b468ed7c326).

Note the following updates to that guide:
- Remove any reference to `zsh` from `.bashrc`
- Set zsh as default shell by running `chsh -s $(which zsh)`
- Change default shell for wsl-terminal to be the same as wsl:  
  In Win10, open `cmd` and run `<your install folder>\wsl-terminal\tools\6-set-default-shell.bat`



HyperJs is a fancy option that I used previously.  
The terminal lives in windows, and creating symlinks to files in windows can produce ...fascinating headaches.  
For now this dotfile will have to be manually copied to `/mnt/c/Users/<username>`.

## VSCode remote

https://github.com/microsoft/vscode-remote-release  
zsh + tmux can sometimes be tricky to run when using the vscode remote extension. Depending on update I have to turn of automatic start of tmux to get the extension to be able to connect to wsl.

Trouble with WSL1  
Sometimes VSCode remote will lock files in wsl1, see [I see EACCESS: permission denied error trying to rename a folder in the open workspace](https://code.visualstudio.com/docs/remote/wsl#_i-see-eaccess-permission-denied-error-trying-to-rename-a-folder-in-the-open-workspace)  
While we wait for WSL2 (the only place this will be fixed), we have the following options:  
1. Close VSCode, run command, reopen VSCode
1. In VSCode set `remote.WSL.fileWatcher.polling` to true

For NPM troubles it usually boils down to ownership of dir `node_modules`, which npm itself some times make a mess of.  
Fix by executing `sudo chown -R $(whoami) node_modules`

## Docker

wsl + docker in windows path workaround
```sh
sudo mkdir /c
sudo mount --bind /mnt/c /c
```

## ArduSub development environment

If you use Ubuntu then this setup is quite easy:

1. Follow the [installation tutorials](https://www.ardusub.com/developers/developers.html)
1. In the ArduPilot guide, see [Setting up the waf Build Environment on Windows10 using WSL](https://ardupilot.org/dev/docs/building-setup-windows10.html)
1. The "install preqreqs" script provided by ArduPilot guide will update your `.profile`  
   You will need to move the settings that was added to `.profile` to what ever is your shell profile script, see ["`.profile` is not read"](#profile-is-not-read), and then restart your WSL session to reload the profile.  
   Verify that `$PATH` now include the paths added by ArduPilot settings.
1. Setup [x-server](x-server.md) for visual output  
   - Native opengl is supported by MAVProxy Ground Control Station
1. Done!

## ROS development environment

See [ROS README](./ros/README.md)  

## Windows terminal

See [Scott Hanselmann post](https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx)

### Powershell
To be able to run themes etc you need to be able to run scripts: Run `Set-ExecutionPolicy RemoteSigned`
- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh)  

## Resources

###### Official documentation
- [Windows Subsystem for Linux Documentation](https://msdn.microsoft.com/en-us/commandline/wsl/about)
- [Microsoft/WSL git repo](https://github.com/Microsoft/WSL/)  
  MS is fairly active in answering issues and providing workarounds when possible until fix is available
- [Managing multiple Linux Distributions](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#managing-multiple-linux-distributions)

###### Setup
- [Bash On Ubuntu On Windows](https://github.com/abergs/ubuntuonwindows)
- [How to Install zsh and Oh My Zsh in Windows 10](https://www.maketecheasier.com/install-zsh-and-oh-my-zsh-windows10/)
- [Guide - Developing on Windows 10 using WSL](https://discourse.roots.io/t/guide-developing-on-windows-10-using-wsl/9380)
- [Shell Scripting Tutorial](https://www.shellscript.sh)

###### Examples
- [Living inside the updated windows subsystem for linux](https://taoofmac.com/space/blog/2017/05/07/1920)
- [dotfiles-win](https://github.com/jieverson/dotfiles-win)

###### Shell scripting
- [Shell Scripting Tutorial](https://www.shellscript.sh/)
- [Bash scripting tutorial](https://ryanstutorials.net/bash-scripting-tutorial/)

## Odd bits  

- Nothing so far :)


## Troubleshooting

### `.profile` is not read

So you have installed something that added config to `.profile`, but you cannot see that these changes are actually being read.  
A typically example is changes to `$PATH`.  
Welcome to linux where everything is customized: `.profile` is not read if `bash`, `zsh` or which ever else custom shell is present.

_Solution_  
`bash`, `zsh` and similar shells have their own profile configs due to misc incompatabilities with the good'ol'days `sh`.  
Simply copy what you need from `. profile` to `.zprofile` (in case of `zsh`).

## Windows terminal is dropping frames when nvidia G-Sync is active
For long discussion see [terminal git issue 649](https://github.com/microsoft/terminal/issues/649)
The only way I could fix this in my machine was to add the setting `"experimental.rendering.software": true` in `settings.json`
