if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/ced/app/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/ced/app/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/ced/app/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/ced/app/google-cloud-sdk/completion.bash.inc'
fi

test -r /sw/bin/init.sh && . /sw/bin/init.sh
