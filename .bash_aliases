# Git
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcsm='git commit -s -m'
alias gd='git diff'
alias glg='git log --stat'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gst='git status'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'

# Maven
alias mci='mvn clean install'

# k8s
alias k=kubectl
alias kg="kubectl get"
alias kaf="kubectl apply -f"
alias kdel="kubectl delete"
alias kdelf="kubectl delete -f"
alias kgp="kubectl get pod"
alias kgw="watch -n 1 kubectl get"
alias kgpw="watch -n 1 kubectl get po -A"
alias kgaw="watch -n 1 kubectl get all -A"
alias klogs="kubectl logs -f"
alias k2logs="kubectl -n kubearmor logs -f"
alias kdes="kubectl describe"

alias kai="karmor install -n kubearmor"
alias kaui="karmor uninstall -n kubearmor"
alias huop="helm uninstall kubearmor-operator -n kubearmor"

# Ubuntu
alias instal='sudo apt update && sudo apt install -y'
alias uninstal='sudo apt remove -y'
