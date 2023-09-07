# .bash_profile

export XEDITOR="gvim -f"
export EDITOR=vim
export PAGER=less
#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8

[ -f ~/.bash_profile_local ] && . ~/.bash_profile_local

# When running in an interactive login shell, source bashrc if it exists
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    [ -f ~/.bashrc ] && . ~/.bashrc
fi
