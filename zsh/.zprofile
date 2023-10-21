[ -d ~/bin ] && PATH=~/bin:$PATH
[ -f ~/.bash_profile ] && . ~/.bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"

case "$TERM" in
    tmux*)
        TERM=screen
        ;;
esac

