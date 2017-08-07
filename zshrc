# OHMYZSH THINGS
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="svera"
plugins=(git git-extras zsh-autosuggestions rails golang npm docker docker-compose fast-syntax-highlighting)

# Set up path, before loading plugins
source ~/.zsh/path.zsh

# Initialize ohmyzsh - load plugins
source $ZSH/oh-my-zsh.sh

# fpath=(/usr/local/share/zsh-completions $fpath)

# Personal configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export K8S_VERSION='v1.2.3'

# The terminal's flow control commands may interfere with Ctrl-S and Ctrl-Q; this can be fixed (in the terminal, not in Vim!) with
stty start undef stop undef

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh

# fix terminals to send ctrl-h to neovim correctly
[[ -f "~/.$TERM.ti" ]] && tic ~/.$TERM.ti

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
source '/Users/svera/Downloads/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/svera/Downloads/google-cloud-sdk/completion.zsh.inc'

# awscli completion
source /usr/local/share/zsh/site-functions/_aws
