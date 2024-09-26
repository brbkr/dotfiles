#!/bin/bash

set -e

PACKPATH=~/.local/share/nvim/site/start

function pullpackage()
{
    [ $# -eq 1 ] || exit 1
    set -e
    mkdir -p $PACKPATH
    local readonly gh=https://github.com/$1
    local readonly bn=$(basename $gh)
    (cd $PACKPATH; if [ -d $bn ]; then cd $bn; git pull; else git clone $gh $bn; fi)
}

set -x
pullpackage neovim/nvim-lspconfig
pullpackage RRethy/base16-nvim
pullpackage ngemily/vim-vp4
pullpackage junegunn/fzf
pullpackage junegunn/fzf.vim

(cd ~/.fzf; git pull)
