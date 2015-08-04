# export PATH="/usr/local/bin:$HOME/.bin:/usr/sbin:/sbin:$PATH" # This is on .zprofile
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"
# go 
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
# binstubs - keep always at EOF
export PATH=".git/safe/../../bin:$PATH"
