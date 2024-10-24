# .bashrc
# vscode
[ -d ~/bin ] && PATH=~/bin:$PATH

[ -z "$PS1" ] && return
[ -t 1 ] || return
[ -f ~/.bashrc_local ] && . ~/.bashrc_local
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Colors
#
# - Experimenting a bit here.  I prefer to allow vscode to define its own
#   colors.
# 
#if [ -z "$VSCODE_IPC_HOOK_CLI" ]; then
#    BASE16_SHELL="$HOME/.config/base16-shell/"
#    if  [ -s "$BASE16_SHELL/profile_helper.sh" ]; then
#	. "$BASE16_SHELL/profile_helper.sh"
#    fi
#fi
#if [ -z "$VSCODE_IPC_HOOK_CLI" ]; then
#    base16_default-dark
#fi

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

# PWD in xterm title
PROMPT_COMMAND='xterm-title ${PWD/#$HOME/~} [${HOSTNAME%%.*}]'

# Direnv support
[ -x ~/bin/direnv ] && eval "$(direnv hook bash)"

set -o history              # enable history
