if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

test -r /sw/bin/init.sh && . /sw/bin/init.sh
