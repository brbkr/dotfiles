[ -d ~/bin ] && PATH=~/bin:$PATH
[ -f ~/.bash_profile ] && . ~/.bash_profile
[ -f /etc/zprofile ] && . /etc/zprofile
eval "$(/usr/local/bin/brew shellenv)"

case "$TERM" in
    tmux*)
        TERM=screen
        ;;
esac

