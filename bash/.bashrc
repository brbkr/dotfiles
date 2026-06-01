# .bashrc

[ -d ~/bin ] && PATH=~/bin:$PATH

is_interactive()
{
    # Defensive much?
    [[ "$-" =~ "i" ]] && [ -n "$PS1" ] && [ -t 1 ] && return 0
}

xterm-title()
{
    # The character sequence to change the title looks like this:
    #   ESC]n;stringCTRL-G
    #
    # Where:
    #   n=0, change icon name and window title to "string",
    #   n=1, change icon name to "string",
    #   n=2, change window title to "string".
    echo -en "\e]0;$*\a"
}

if is_interactive; then
    set -o history              # enable history
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash

    # PWD in xterm title
    PROMPT_COMMAND='xterm-title ${PWD/#$HOME/~} [${HOSTNAME%%.*}]'
    HISTCONTROL=ignoredups      # only add a command to history once
    HISTSIZE=10000
    PS1="; "

    set -o physical             # pwd returns physical paths
    shopt -s checkwinsize       # update LINES and COLUMNS
    shopt -s cmdhist            # multi-line commands go in history as 1 line
    shopt -s histappend         # don't overwrite .bash_history
    shopt -s extglob            # enable extended glob pattern matching
    stty -ixon                  # disable Ctrl-s/Ctrl-q; use with readline instead

    if [ "$(uname -s)" = "Linux" ]; then
        alias ls='ls -F --color=never'
        alias grep='grep --color'
        unset LS_COLORS
    fi
fi

[ -f ~/.bashrc_local ] && source ~/.bashrc_local
. "$HOME/.cargo/env"
