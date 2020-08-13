#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin
alias goric='cd ${GOPATH}/src/github.com/ricardo-ch'

# GNU tar for Ansible unarchive on MacOS
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"

# Python
export PATH="/usr/local/opt/python@3.7/libexec/bin:$PATH"
#export PATH="/usr/local/opt/python@3.7/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Dotfiles/bin" ]; then
  PATH="$HOME/Dotfiles/bin:$HOME/bin:$PATH"
fi

# Use sbin for mtr
export PATH="$PATH:/usr/local/sbin"

# Set path to include local bin/ directories for bundler binstubs
export PATH="$PATH:./bin"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

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
if [[ -e /usr/local/bin/brew && -f $(brew --prefix)/etc/bash_completion ]]; then
  source $(brew --prefix)/etc/bash_completion
fi

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -shorten-gke-names -modules "venv,ssh,cwd,perms,git,exit,root" -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export EDITOR=vim
export DIFFPROG=vimdiff

set -o vi

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/ced/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/ced/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/ced/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/ced/google-cloud-sdk/completion.bash.inc'
fi

# Bash completion for awscli
complete -C '/usr/bin/aws_completer' aws

#fix chrome
export CHROMIUM_USER_FLAGS="--ignore-gpu-blacklist"

# Activate Amazon Web Service CLI bash completion
complete -C aws_completer aws

# kubectl shell completion
source "${HOME}/.completion.bash.inc"

# Confirmation
confirm() {
  read -r -p "Are you sure? [y/N] " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
      true
  else
      false
  fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

_rdp() {
  project=$1
  zone=$2
  vm=$3
  port=$4
  try_sleep=3
  remaining_try=10
  last_exit_code="1"

  echo "Creating tunnel to project=$project zone=$zone vm=$vm port=$port"

  gcloud beta compute start-iap-tunnel --project $project --zone $zone "$vm" 3389 --local-host-port=localhost:$port &

  # Wait some time before first try
  sleep $try_sleep
  while [ ! "$last_exit_code" = "0" -a ! "$remaining_try" = "0" ]
  do
    echo "Remaining tries : $remaining_try"
    let remaining_try--

    nc -vz 127.0.0.1 $port
    last_exit_code="$?"
    echo "Last exit code $last_exit_code"
    
    # Wait some time before next try
    sleep $try_sleep
  done

  apple_script=$(cat <<==apple_script
tell application "Microsoft Remote Desktop Beta"
  activate
  tell application "System Events"
    set frontmost of process "Microsoft Remote Desktop Beta" to true
    tell process "Microsoft Remote Desktop Beta"
      keystroke "f" using {command down}
      keystroke "$vm" --search query
      delay 0.5
      keystroke tab
      key code 125 -- down
      key code 36 --enter		
    end tell
  end tell
end tell
==apple_script
)

  echo -e "$apple_script" | osascript 
}

