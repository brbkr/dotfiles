[ -f /etc/zshrc ] && . /etc/zshrc

# Colors
BASE16_SHELL="$HOME/.config/base16-shell/"
if  [ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ]; then
    . "$BASE16_SHELL/profile_helper.sh"
fi
base16_default-dark

export PATH=$PATH:/usr/local/zfs/bin:/usr/local/bin
export PS1="; "

# Emacs keyboard shortcuts
bindkey -e

alias find_shared="mdfind -onlyin /Users/jtb/Documents/ 'kMDItemIsShared == 1'"

