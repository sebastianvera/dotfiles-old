alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Heroku staging
alias staging-console='heroku run rails console --remote staging'
alias staging-tail='heroku logs --tail --remote staging'

# Heroku production
alias production-console='heroku run rails console --remote production'
alias production-tail='heroku logs --tail --remote production'

alias pc='production-console'
alias sc='staging-console'

alias rdm='rake db:migrate'
alias rdtp='rake db:test:prepare'
alias fs='foreman start'

alias db-pull-staging='development restore staging'
alias db-pull-production='development restore production'
alias db-update-staging='staging restore production'

alias so='source ~/dotfiles/zsh/aliases'
alias aliases='vim ~/dotfiles/zsh/aliases'
alias zshfunctions='vim ~/dotfiles/zsh/functions'

alias a='ls -al'
alias rip="curl -s http://remote-ip.herokuapp.com"
alias h='heroku'
alias v='vim'
alias gds='git diff --staged'
alias glogg="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --max-count=30"
alias glg="g lg"
alias tics='udp TICSII'
alias gim='udp Reconomiento\ de\ patrones/Proyecto\ 2/scraper/'
alias tapas='cd ~/Documents/Ruby/RubyTapas'

function ip() {
  ifconfig | grep inet | grep broadcast | awk '{print $2}'
}
function ips() {
  local private_ip=`ip`;
  echo "Private ip: $private_ip";
  local public_ip=`rip`
  echo "Public ip: $public_ip";
}