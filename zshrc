# OHMYZSH THINGS
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="svera"
plugins=(git rails tmux golang zsh-syntax-highlighting)

# Set up path, before loading plugins
source ~/.zsh/path.zsh

# Initialize ohmyzsh - load plugins
source $ZSH/oh-my-zsh.sh

# Personal configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh

