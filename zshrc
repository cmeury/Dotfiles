
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# fix https://stackoverflow.com/questions/25614613/how-to-disable-zsh-substitution-autocomplete-with-url-and-backslashes
DISABLE_MAGIC_FUNCTIONS=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=90

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker history)
plugins+=(zsh-vi-mode)
#plugins+=(zsh-autocomplete)
plugins+=(zsh-syntax-highlighting)
#zstyle ':autocomplete:*' default-context history-incremental-search-backward

source $ZSH/oh-my-zsh.sh

# User configuration

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs status)
ZSH_HIGHLIGHT_STYLES[comment]='none'

# export MANPATH="/usr/local/man:$MANPATH"

#export GOROOT=/usr/local/go
export GOROOT=/home/cmeury/code/airlock-saas/tools/go
export GOPATH=$HOME/go

path+=("$GOPATH/bin")
path+=("$GOROOT/bin")
path+=("$HOME/Library/Python/3.8/bin")
path+=("$HOME/.local/bin")
path=('/usr/local/opt/gnu-tar/libexec/gnubin' $path)  # GNU tools from homebrew
path=('/opt/homebrew/opt/libpq/bin' $path)            # psql and other tools
path=("$HOME/bin" $path)                              # ensure we are using executables in home dir before system ones
path=("$HOME/Dotfiles/bin" $path)                              # ensure we are using executables in home dir before system ones
path+=("$HOME/code/devops/infrastructure/runbooks/connect")
path+=("$HOME/code/devops/infrastructure/runbooks/psql-debug")
path+=("${KREW_ROOT:-$HOME/.krew}/bin")


export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# export to sub-processes (make it inherited by child processes)
export PATH

# fixing the error: 'there was a problem with the editor "vi"' when running kubectl edit
export KUBE_EDITOR="vim"

# azure cli completion
autoload -U +X bashcompinit && bashcompinit
source ~/.bin/az.completion

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# kubectl shell completion (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#enable-shell-autocompletion)
#autoload -U +X compinit && compinit
#source <(kubectl completion zsh)

# get zsh complete kubectl
source <(kubectl completion zsh)

# kubecolor - https://github.com/kubecolor/kubecolor
alias kubectl=kubecolor
# make completion work with kubecolor
compdef kubecolor=kubectl

# disable history sharing between sessions (https://github.com/ohmyzsh/ohmyzsh/issues/2537)
unsetopt share_history

# Bash style history (https://superuser.com/questions/380657/history-search-backward-working-differently-in-zsh-than-in-bash)
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward
bindkey "^[[A~" history-beginning-search-backward
bindkey "^[[B~" history-beginning-search-forward


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# direnv hook - https://direnv.net/
eval "$(direnv hook zsh)"

# rust
# . "$HOME/.cargo/env"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Terragrunt Cache
export TG_PROVIDER_CACHE_DIR="${HOME}/.terragrunt-provider-cache"
export TG_PROVIDER_CACHE=1


## ALIASES ===================

# system tools
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -G'
alias grep='grep --color=auto'
alias ping='prettyping'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules --exclude .wercker"
alias bat='batcat'

# various commands
alias gw='./gradlew'
alias v='vagrant'
alias tf='terraform'
alias tg='terragrunt'
alias tgp='terragrunt plan'
alias tga='terragrunt apply'
alias tgar='terragrunt apply -refresh-only'
alias tgaa='terragrunt apply -auto-approve' # careful
alias tgaar='terragrunt apply -refresh-only -auto-approve'
alias gc='gcloud'
alias gcca='gcloud config configurations activate'
alias a='ansible'
alias ap='ansible-playbook'

# editor
alias vi='vim'

# docker
alias dr="docker run --rm -it"

# grep
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# kubernetes
alias k9r='HTTPS_PROXY=localhost:8888 k9s --readonly'
alias k='kubectl'
alias kc='kubectl config'
alias kpf='kubectl port-forward'
alias kex='kubectl exec -it'
alias kgvs='kubectl get virtualservice'
alias kgd='kubectl get deployments.iam.cloud.airlock.com'
alias kgdy='kubectl get deployments.iam.cloud.airlock.com -o yaml'
alias kgr='kubectl get deploymentrevisions.iam.cloud.airlock.com'
alias kgry='kubectl get deploymentrevisions.iam.cloud.airlock.com -o yaml'
alias kev="kubectl get events --sort-by='.lastTimestamp'"
alias kevs='kubectl edit virtualservice'
alias kggw='kubectl get gateway'
alias kegw='kubectl edit gateway'
alias kgy='kubectl get -o yaml'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kkill='kubectl delete --force --grace-period=0 pod'
alias kg='kubectl get'
alias kgp='kubectl get pods -o wide'
alias kgiam='kubectl get pods --selector app.kubernetes.io/name=airlock-iam --all-namespaces'
alias kgpt="kubectl get pods -o wide | grep -v -E '(Terminated|NodeShutdown)'"
alias kgpa='kubectl get pods -o wide --all-namespaces'
alias kgpar="kubectl get pods -o wide --all-namespaces | grep -v -E '(Running|Completed)'"
alias kgps="kubectl get pods -o wide --all-namespaces --sort-by='{.status.containerStatuses[:1].restartCount}'"
alias podgrep='kubectl get pods -o wide --all-namespaces | grep '
alias svcgrep='kubectl get service --all-namespaces | grep '
alias kl='kubectl logs --follow=true'
alias i='istioctl'
alias mk='minikube'

# batcat
alias ybat="bat -l yaml"
yfilt() {
  kfilt -i kind="${1}" | bat -l yaml
}

# jless
alias yless="jless --yaml"

# git
alias g='git'
alias main='git checkout main'
alias gskip='git push -o ci.skip'

# dirs
alias cda='cd ${HOME}/code/airlock-saas'

# todoist - https://github.com/alanvardy/tod
alias t='tod -q'

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
