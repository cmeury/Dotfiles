# system tools
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -G'
alias grep='grep --color=auto'
alias ping='prettyping'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules --exclude .wercker"

# ssh
alias prod="gcloud beta compute ssh adm_cmeury_s10@zrh-srv-p-cfm10 --project ricardo-legacy --ssh-key-file ~/.ssh/ricardo --zone=europe-west1-c --tunnel-through-iap"
alias dev="gcloud beta compute ssh adm_cmeury_s10@zrh-srv-b-cfm10 --project ricardo-dev-legacy --ssh-key-file ~/.ssh/ricardo --zone=europe-west1-b --tunnel-through-iap"

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
alias kgvs='kubectl get virtualservice'
alias kevs='kubectl edit virtualservice'
alias kggw='kubectl get gateway'
alias kegw='kubectl edit gateway'
alias kgy='kubectl get -o yaml'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kkill='kubectl delete --force --grace-period=0 pod'
alias kg='kubectl get'
alias kgp='kubectl get pods -o wide'
alias kgpa='kubectl get pods -o wide --all-namespaces'
alias kgpar="kubectl get pods -o wide --all-namespaces | grep -v -E '(Running|Completed)'"
alias kgps="kubectl get pods -o wide --all-namespaces --sort-by='{.status.containerStatuses[:1].restartCount}'"
alias podgrep='kubectl get pods -o wide --all-namespaces | grep '
alias svcgrep='kubectl get service --all-namespaces | grep '
alias kl='kubectl logs --follow=true'
alias i='istioctl'
alias mk='minikube'

# getting crazy with kubectl
ked(){
    kget_line=$(kubectl get deploy --all-namespaces --no-headers | grep ${1}| head -1)
    if [ "${kget_line}" == "" ]; then
      echo "No deployment found"
      return 1
    fi
    ns=$(echo ${kget_line} | awk '{print $1}')
    deployment=$(echo ${kget_line} | awk '{print $2}')
    echo "Editing deployment ${deployment} in namespace ${ns}..."
    kubectl edit deployment --namespace=${ns} ${deployment}
}


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
alias pscripts='cd ${HOME}/ricardo/platform-scripts'
alias pportal='cd ${HOME}/ricardo/platform-portal'
alias parch='cd ${HOME}/ricardo/ricardo-architecture'
alias pdeploy='cd ${HOME}/ricardo/platform-deploy'
alias pansible='cd ${HOME}/ricardo/ansible'

# RDP
alias rdp_beta="_rdp ricardo-dev-legacy europe-west1-b zrh-srv-b-jump10 3390 "
alias rdp_prod="_rdp ricardo-legacy europe-west1-c rm-sv-jmp01 3391"

