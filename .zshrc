# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Start completion system
# default setting
#   autoload bashcompinit && bashcompinit
autoload -U compaudit compinit bashcompinit
compaudit && compinit && bashcompinit

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent zsh-dircolors-solarized tmux kubectl docker)

# Plugin: zsh tmux settings
# Disable autostart if VSCode is misbehaving
ZSH_TMUX_AUTOSTART="true"
# do not autoconnect to existing session, allows a new iTerm tab to open with a new tmux session
ZSH_TMUX_AUTOCONNECT="false"

ZSH_DISABLE_COMPFIX=false

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Terminal settings
TERM=xterm-256color

# WSL aliases
alias exit-wsl="killall -r '.*'"

# Kubernetes settings
KUBE_EDITOR="nano"

# Docker aliases
alias docker-clean-unused='docker system prune --all --force --volumes'
alias docker-clean-containers='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias docker-clean-volumes='docker volume rm $(docker volume ls -q)'
alias docker-clean-all='docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes'
alias docker-clean-images='docker rmi $(docker images -a -q)'

# Kubernetes tools
# Autocomplete is included in kubectl, https://kubernetes.io/docs/tasks/tools/install-kubectl/
source <(kubectl completion zsh)

# VPN aliases
alias vpn-enable='source ~/.dotfiles/vpn/enable-win10-vpn.sh'

# Startup directory
cd "$HOME"

# Golang
# https://github.com/golang/go/wiki/GOPATH
# The GOPATH environment variable is used to specify directories outside of $GOROOT that contain 
# the source for Go projects and their binaries
export GOPATH=/mnt/c/Dev/go-workspace:/mnt/c/Dev/equinor/go-workspace

# NodeJS and npm
# Look for locally installed binaries first
PATH=./node_modules/.bin:$PATH

# NMAP: In WSL it is better to use nmap on the windows side
alias nmap='"/mnt/c/Program Files (x86)/Nmap/nmap.exe"'

# X-Server settings
export DISPLAY="127.0.0.1:0"

# Run ROS environment and workspace setup
if [ -f "$HOME/ros_env_setup.sh" ]; then
    source "$HOME/ros_env_setup.sh"
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Enable local ArduPilot development environment settings
if [ -f "$HOME/ardupilot-development.sh" ] ; then
    source "$HOME"/ardupilot-development.sh
fi

export PATH=$PATH:/home/wonderlove/bin

# Rust
if [ -f "$HOME/.cargo/env" ]; then
    source $HOME/.cargo/env
fi

