# .bash_profile

export XEDITOR="gvim -f"
export EDITOR=vim
export PAGER=less
#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8

#
# Start an SSH agent.
#
# Adapted from https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
#
function ssh-agent-env {
    [ -z "$HOSTNAME" ] && export HOSTNAME=$(hostname)
    local readonly envfile=~/.ssh/agent_env_$HOSTNAME
    [ -f $envfile ] && . $envfile
    if [ -z "$SSH_AGENT_PID" ] || ! ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent$ >/dev/null 2>&1; then
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' >$envfile || return 1
	chmod 600 $envfile
	. $envfile
    fi
}
function ssh-add-all {
    for f in ~/.ssh/*.pub; do
        ssh-add ~/.ssh/$(basename $f .pub)
    done
}
ssh-agent-env

[ -f ~/.bash_profile_local ] && . ~/.bash_profile_local

# When running in an interactive login shell, source bashrc if it exists
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    [ -f ~/.bashrc ] && . ~/.bashrc
fi
