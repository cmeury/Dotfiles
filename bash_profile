if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/opt/node@8/bin:$PATH"

. ${HOME}/app/google-cloud-sdk/completion.bash.inc
. ${HOME}/app/google-cloud-sdk/path.bash.inc

