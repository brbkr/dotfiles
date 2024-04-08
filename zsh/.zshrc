[ -f /etc/zshrc ] && . /etc/zshrc
bindkey -e

export PATH=$PATH:/usr/local/zfs/bin:/usr/local/bin
export PS1="; "

# Emacs keyboard shortcuts
bindkey -e

alias find_shared="mdfind -onlyin /Users/jtb/Documents/ 'kMDItemIsShared == 1'"
