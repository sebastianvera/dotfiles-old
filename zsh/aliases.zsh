alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

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
alias db-pull='production backup && development restore production'

alias so='source ~/dotfiles/zsh/aliases.zsh'
alias aliases='nvim ~/dotfiles/zsh/aliases.zsh'
alias zshfunctions='nvim ~/dotfiles/zsh/functions.zsh'

alias a='ls -al'
alias rip="curl -s 'https://api.ipify.org'"
alias v='nvim'
alias v.='v .'
alias vi='nvim'
alias vim='nvim'
alias gds='git diff --staged'
alias glogg="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --max-count=30"
alias glg="g lg"
alias examen='udp "examen"'
alias tapas='cd ~/Documents/Ruby/RubyTapas'
alias amend='git commit -v --amend'
alias gitconfig='nvim ~/.gitconfig'
# alias git=hub
alias ditum='cd ~/Code/go/src/github.com/ditum/'
alias k=kubectl
alias pods='kubectl get pods'
alias kpod='kubectl get pod --selector=app=kafka,tier=backend -o jsonpath={.items..metadata.name}'
alias klogs='kubectl logs $(kpod) -f'
alias zkpod='kubectl get pod --selector=app=kafka,tier=backend -o jsonpath={.items..metadata.name}'
alias zklogs='kubectl logs $(zkpod) -f'

alias spacemacs='HOME=~/spacemacs emacs'
