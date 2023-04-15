# Some aliases for Gitpod

# Git
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcsm='git commit -s -m'
alias gd='git diff'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias glum='git pull upstream $(git_main_branch)'
alias glg='git log --stat'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gst='git status'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'

# Maven
alias mci='mvn clean install'

# K8S
alias k='kubectl'
alias kgp='kubectl get pods'
alias kg='kubectl get'
alias kgd='kubectl get deployments'

# Ubuntu
alias instal='sudo apt update && sudo apt install -y'
alias uninstal='sudo apt remove -y'
