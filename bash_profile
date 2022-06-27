if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/opt/node@10/bin:$PATH"

export PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

. ${HOME}/google-cloud-sdk/completion.bash.inc
. ${HOME}/google-cloud-sdk/path.bash.inc

  [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_12_HOME=$(/usr/libexec/java_home -v12)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java12='export JAVA_HOME=$JAVA_12_HOME'

export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

#export ANSIBLE_CONFIG="${HOME}/netsec/ansible.cfg"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cedric.meury/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cedric.meury/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cedric.meury/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cedric.meury/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

