# OHMYZSH THINGS
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="svera"
plugins=(git rails golang npm github zsh-syntax-highlighting)

# Set up path, before loading plugins
source ~/.zsh/path.zsh

# Initialize ohmyzsh - load plugins
source $ZSH/oh-my-zsh.sh

# Personal configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# The terminal's flow control commands may interfere with Ctrl-S and Ctrl-Q; this can be fixed (in the terminal, not in Vim!) with
stty start undef stop undef

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh

# fix terminals to send ctrl-h to neovim correctly
[[ -f "~/.$TERM.ti" ]] && tic ~/.$TERM.ti
