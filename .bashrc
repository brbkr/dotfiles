# .bashrc

[ -z "$PS1" ] && return
[ -t 1 ] || return
[ -f ~/.bashrc_local ] && . ~/.bashrc_local

HISTCONTROL=ignoredups      # only add a command to history once
HISTSIZE=10000
PS1="; "

set -o physical             # pwd returns physical paths
set -o history              # enable history
shopt -s checkwinsize       # update LINES and COLUMNS
shopt -s cmdhist            # multi-line commands go in history as 1 line
shopt -s histappend         # don't overwrite .bash_history
shopt -s extglob            # enable extended glob pattern matching
stty -ixon                  # disable Ctrl-s/Ctrl-q; use with readline instead

alias ls='ls -F --color'
alias grep='grep --color'

# LS colors
#
# Reference:
#    Key /etc/DIR_COLORS name    Notes
#    no  NORMAL, NORM    Global default, although everything should be something
#    fi  FILE    Normal file
#    di  DIR Directory
#    ln  SYMLINK, LINK, LNK  Symbolic link. If you set this to 'target' instead of a numerical value, the colour is as for the file pointed to.
#    pi  FIFO, PIPE  Named pipe
#    do  DOOR    Door
#    bd  BLOCK, BLK  Block device
#    cd  CHAR, CHR   Character device
#    or  ORPHAN  Symbolic link pointing to a non-existent file
#    so  SOCK    Socket
#    su  SETUID  File that is setuid (u+s)
#    sg  SETGID  File that is setgid (g+s)
#    tw  STICKY_OTHER_WRITABLE   Directory that is sticky and other-writable (+t,o+w)
#    ow  OTHER_WRITABLE  Directory that is other-writable (o+w) and not sticky
#    st  STICKY  Directory with the sticky bit set (+t) and not other-writable
#    ex  EXEC    Executable file (i.e. has 'x' set in permissions)
#    mi  MISSING Non-existent file pointed to by a symbolic link (visible when you type ls -l)
#    lc  LEFTCODE, LEFT  Opening terminal code
#    rc  RIGHTCODE, RIGHT    Closing terminal code
#    ec  ENDCODE, END    Non-filename text
#    *.extension     Every file using this extension e.g. *.jpg
#
# Colors:
#    00  Default colour
#    01  Bold
#    04  Underlined
#    05  Flashing text
#    07  Reversetd
#    08  Concealed
#
#    30  Black
#    31  Red
#    32  Green
#    33  Orange
#    34  Blue
#    35  Purple
#    36  Cyan
#    37  Grey
#
#    40  Black background
#    41  Red background
#    42  Green background
#    43  Orange background
#    44  Blue background
#    45  Purple background
#    46  Cyan background
#    47  Grey background
#
#    90  Dark grey
#    91  Light red
#    92  Light green
#    93  Yellow
#    94  Light blue
#    95  Light purple
#    96  Turquoise
#    97  White
#    100 Dark grey background
#    101 Light red background
#    102 Light green background
#    103 Yellow background
#    104 Light blue background
#    105 Light purple background
#    106 Turquoise background
#    107 White background
#
export LS_COLORS="ow=01;90:di=01;90:ex=00;32"

# color PS1 with error code display
#   <tail pwd> [<non-zero exit status>] >
if false; then
    # foreground            # background
    PL='\[\033[m\]'                             # all plain
    FN='\[\033[0;30m\]'     BN='\[\033[40m\]'   # black
    FR='\[\033[0;31m\]'     BR='\[\033[41m\]'   # red
    FG='\[\033[0;32m\]'     BG='\[\033[42m\]'   # green
    FY='\[\033[0;33m\]'     BY='\[\033[43m\]'   # yellow
    FB='\[\033[0;34m\]'     BB='\[\033[44m\]'   # blue
    FP='\[\033[0;35m\]'     BP='\[\033[45m\]'   # purple
    FC='\[\033[0;36m\]'     BC='\[\033[46m\]'   # cyan
    FW='\[\033[0;37m\]'     BW='\[\033[47m\]'   # white
    FZ='\[\033[1;30m\]'     BW='\[\033[47m\]'   # grey
    PS1="$FG\W$PL $FR\${?/#0/}$PL> "
    unset PL {F,B}{N,R,G,Y,B,P,C,W,Z}           # dont clutter env
fi

# PWD in xterm title
if [ -n "$DISPLAY" ]; then
    PROMPT_COMMAND='printf "\033]0;[%s] %s\007" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
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
    printf "]0;%s" $STRING
}
