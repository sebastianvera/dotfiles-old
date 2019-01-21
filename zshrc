# OHMYZSH THINGS
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="svera"
plugins=(git git-extras git-flow zsh-autosuggestions nvm golang npm docker docker-compose fast-syntax-highlighting)

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

# awscli completion
source /usr/local/share/zsh/site-functions/_aws

export NVM_DIR=$(realpath "$HOME/.nvm")
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/svera/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/svera/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/svera/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/svera/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
