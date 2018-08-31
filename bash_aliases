# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -G'
alias grep='grep --color=auto'

# editor
alias vi='vim'

# docker
alias dr="docker run --rm -it"

# grep
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
	
# kubernetes
alias k='kubectl'
alias kc='kubectl config'
alias kcu='kubectl config use-context'
alias kcg='kubectl config get-contexts'
alias kpf='kubectl port-forward'
alias kex='kubectl exec -it'
alias ked='kubectl edit deployment'
alias keing='kubectl edit ing'
alias kgvs='kubectl get virtualservice'
alias kevs='kubectl edit virtualservice'
alias kggw='kubectl get gateway'
alias kegw='kubectl edit gateway'
alias kgy='kubectl get -o yaml'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kg='kubectl get'
alias kgp='kubectl get pods -o wide'
alias kgpa='kubectl get pods -o wide --all-namespaces'
alias kgpar="kubectl get pods -o wide --all-namespaces | grep -v -E '(Running|Completed)'"
alias podgrep='kubectl get pods -o wide --all-namespaces | grep '
alias kl='kubectl logs --follow=true'
alias i='istioctl'
alias mk='minikube'

# various commands
alias tf='terraform'
alias gc='gcloud'

# git
alias g='git'
alias gp='git pull'
alias gs='git status'

# dirs
alias goric='cd ${GOPATH}/src/github.com/ricardo-ch'
alias ric='cd ${HOME}/ricardo'
alias pcharts='cd ${HOME}/ricardo/platform-charts'
alias pcloud='cd ${HOME}/ricardo/cloud'
alias pportal='cd ${HOME}/ricardo/platform-portal'
alias parch='cd ${HOME}/ricardo/ricardo-architecture'
alias pdeploy='cd ${HOME}/ricardo/platform-deploy'
alias pansible='cd ${HOME}/ricardo/ansible'


