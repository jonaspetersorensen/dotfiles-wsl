# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Docker - set default host to be Docker on Windows
export DOCKER_HOST=localhost:2375

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# zsh tmux settings
ZSH_TMUX_AUTOSTART="true"
# do not autoconnect to existing session, allows a new iTerm tab to open with a new tmux session
ZSH_TMUX_AUTOCONNECT="false"

# nvm seems to mess up zsh startup
# start nvm
#if [ -r ~/.nvm ]; then
#	export NVM_DIR="$HOME/.nvm"
#	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion  
#fi

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

ZSH_DISABLE_COMPFIX=true

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

# X-Server settings
export DISPLAY="127.0.0.1:0"

# Add CD alias
alias cd-dev='cd /mnt/c/dev'
alias cd-equinor='cd /mnt/c/dev/equinor'

# Kubernetes settings
KUBE_EDITOR="nano"

# Add docker aliases and functions
alias docker-clean-unused='docker system prune --all --force --volumes'
alias docker-clean-containers='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias docker-clean-volumes='docker volume rm $(docker volume ls -q)'
alias docker-clean-all='docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes'
alias docker-clean-images='docker rmi $(docker images -a -q)'

# Add kubernetes tools.
# https://github.com/shawnxlw/kubernetes-tools
PATH=$HOME/kubernetes-tools/bin:$PATH
. "$HOME/kubernetes-tools/completion/__completion"

# Adding Go to PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/c/Dev/go-workspace

# Run ROS
source /opt/ros/melodic/setup.zsh
