#!/bin/sh

set -e

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

result=0
cd ~/dotfiles
for i in *; do
    if [ -d $i ]; then
        stow $i || result=1
    fi
done

if [ $result -ne 0 ]; then
    exit 1
fi
