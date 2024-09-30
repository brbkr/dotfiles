[ -d ~/bin ] && PATH=~/bin:$PATH
[ -f ~/.bash_profile ] && . ~/.bash_profile
[ -f /etc/zprofile ] && . /etc/zprofile

[ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

case "$TERM" in
    tmux*)
        TERM=screen
        ;;
esac

