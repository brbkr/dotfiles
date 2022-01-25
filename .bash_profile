# .bash_profile

export XEDITOR="gvim -f"
export EDITOR=vim
export PAGER=less
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ -f ~/.bash_profile_local ] && . ~/.bash_profile_local
[ -f ~/.bash_profile ] && . ~/.bashrc
