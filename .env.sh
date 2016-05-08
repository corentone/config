#!/bin/zsh
export PATH=/Users/cdebains/Code/kubernetes/_output/dockerized/bin/darwin/amd64:$PATH:/usr/local/go/bin
#export EDITOR='subl -w'

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias docker-env='eval $(docker-machine env)'
alias kub-local-tunnel='nohup docker-machine ssh `docker-machine active` -N -L 8080:localhost:8080 &'
alias kub-local-run='docker-machine ssh `docker-machine active`'

# Docker-related env
# Commented since if docker machine is not running, it stalls shell startup.
#eval "$(docker-machine env)" 

# Go related env
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
# If using brew, uncomment.
#export GOROOT=/usr/local/opt/go/libexec

# SSH Agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;

    # Adding keys too
    ssh-add ~/.ssh/id_rsa;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent &;
    }
else
    start_agent &;
fi
