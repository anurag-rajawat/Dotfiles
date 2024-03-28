# Ubuntu
alias bat=batcat
alias instal="sudo apt update && sudo apt install -y"
alias uinstal="sudo apt uninstall -y"

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
alias kdes="kubectl describe"
alias m="minikube"
alias mst="minikube start"
alias msp="minikube stop" 

# KubeArmor
alias k2logs="kubectl -n kubearmor logs -f"
alias kai="karmor install -n kubearmor"
alias kaui="karmor uninstall -n kubearmor"
alias kalg="karmor logs"
alias kalgj="karmor logs --json | jq"
alias hiop="helm upgrade --install kubearmor-operator . -n kubearmor --create-namespace"
alias huop="helm uninstall kubearmor-operator -n kubearmor"

# Docker
alias di="docker images"
alias dps="docker ps"
alias ds="docker stop"
alias dcp="docker container prune"
alias dsp="docker system prune"
alias dri="docker rmi"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
