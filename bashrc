#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin

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

if [ -f ~/.aliases ]; then
    . ~/.aliases
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

#fix chrome
export CHROMIUM_USER_FLAGS="--ignore-gpu-blacklist"

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

