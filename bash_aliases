# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -G'
alias grep='grep --color=auto'

# editor
alias vi='vim'

# git
alias g='git'

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
alias ked='kubectl edit'
alias kgy='kubectl get -o yaml'
alias kd='kubectl describe'
alias kdel='confirm && kubectl delete'
alias kg='kubectl get'
alias kgp='kubectl get pods -o wide'
alias kl='kubectl logs --follow=true'

# terraform
alias tf='terraform'

# go
alias goric='cd ${GOPATH}/src/github.com/ricardo-ch'
