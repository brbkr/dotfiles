#!/bin/sh

set -e

rm -f 	~/.bashrc \
	~/.bash_profile
	~/.cshrc \
	~/.login \
	~/.mailrc \
	~/.profile \
	~/.Xdefaults

if [ -d ~/.dotfiles ]; then
	cd ~/.dotfiles
	git pull --ff-only
else
	git clone https://github.com/brbkr/dotfiles ~/.dotfiles
fi

cd ~/.dotfiles
for f in .???*; do
	rm -f ~/$f
	(cd ~/; ln -s .dotfiles/$f $f)
done

[ -d ~/.ssh ] || mkdir ~/.ssh
[ -d ~/.vim ] || mkdir ~/.vim

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git \
		~/.vim/bundle/Vundle.vim
fi

echo "vim +PlugInstall +qall"
