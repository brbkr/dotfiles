#!/bin/sh

set -e

rm -f	~/.cshrc \
	~/.login \
	~/.mailrc \
	~/.profile \
	~/.Xdefaults

if [ -d ~/.dotfiles ]; then
	cd ~/.dotfiles
	git pull --ff-only
else
	git clone git@github.com:brbkr/dotfiles ~/.dotfiles
fi

[ -d ~/.git ] || mkdir ~/.git
[ -d ~/.ssh ] || mkdir ~/.ssh
[ -d ~/.vim ] || mkdir ~/.vim

cd ~/.dotfiles
for i in .???*; do
	[ "$i" = ".git" ] && continue
	[ ! -f "$i" ] && continue
	rm -f ~/$i
	ln -s .dotfiles/$i ~/$i
done

(cd ~/.dotfiles/.config; tar c .) | (cd ~/.config; tar xv -)

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git \
		~/.vim/bundle/Vundle.vim
fi

echo "vim +PluginInstall +qall"
