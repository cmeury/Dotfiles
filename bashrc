#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

c_red='^[[31m'
c_green='^[[32m'
c_sgr0='^[[00m'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# and for macOS
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    echo '* '
  else
    echo ''
  fi
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
parse_kube_ctx()
{
    CONTEXT=$(kubectl config current-context)

    if [ -n "$CONTEXT" ]; then
        echo " [${CONTEXT}]"
    fi
}
parse_kube_ns()
{
  # Prevent globbing of asterisk
  set -f
  contextinfo=$(kubectl config get-contexts --no-headers | grep ^*)
  namespace=$(echo $contextinfo | awk "{print \$5}")
  cluster=$(echo $contextinfo | awk "{print \$3}")
  set +f

  if [ -z "$namespace" ]; then
    namespace="default"
  fi
  echo " [${namespace}@${cluster}]"
}


unset PS1
export PS1="\[\e]0;\h\a\]${debian_chroot:+($debian_chroot)}\[\033[00m\]\[\033[01;34m\] \w\[\033[92m\]\$(parse_kube_ns)\[\033[00m\]\[\033[31m\]\$(parse_git_branch) \[\033[33m\]\$(find_git_dirty)\[\033[00m\]$\[\033[00m\] "

export EDITOR=vim
export DIFFPROG=vimdiff

set -o vi

export WORKON_HOME=${HOME}/Snakepit
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/ced/app/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/ced/app/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/ced/app/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/ced/app/google-cloud-sdk/completion.bash.inc'
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Dotfiles/bin" ]; then
  PATH="$HOME/Dotfiles/bin:$HOME/bin:$PATH"
fi

PATH="$PATH:/home/cemeury/.gem/ruby/2.1.0/bin:/home/cemeury/.gem/ruby/2.2.0/bin"
export CHROMIUM_USER_FLAGS="--ignore-gpu-blacklist"

# Set path to include local bin/ directories for bundler binstubs
export PATH="$PATH:./bin"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin
alias goric='cd ${GOPATH}/src/github.com/ricardo-ch'

# Activate Amazon Web Service CLI bash completion
complete -C aws_completer aws

# kubectl shell completion
source "${HOME}/.completion.bash.inc"

