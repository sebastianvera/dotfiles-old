# export PATH="/usr/local/bin:$HOME/.bin:/usr/sbin:/sbin:$PATH" # This is on .zprofile
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"

# Android studio
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# go
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
