#!/bin/sh

set -e
set -x

rm -f	~/.cshrc \
	~/.login \
	~/.mailrc \
	~/.profile \
	~/.Xdefaults

if [ -d ~/dotfiles ]; then
	cd ~/dotfiles
	git pull --ff-only
else
	git clone git@github.com:brbkr/dotfiles ~/dotfiles
fi

[ -d ~/.git ] || mkdir ~/.git
[ -d ~/.ssh ] || mkdir ~/.ssh
[ -d ~/.vim ] || mkdir ~/.vim

if [ ! -d ~/.fzf ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

(cd ~/dotfiles; stow */)
