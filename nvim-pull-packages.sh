#!/bin/bash

set -e

PACKPATH=~/.local/share/nvim/site/start

function pullpackage()
{
    [ $# -eq 2 ] || exit 1
    set -e
    mkdir -p $PACKPATH
    (cd $PACKPATH; if [ -d $1 ]; then cd $1; git pull; else git clone $2 $1; fi)
}

set -x
pullpackage nvim-lspconfig https://github.com/neovim/nvim-lspconfig
pullpackage base16-nvim https://github.com/RRethy/base16-nvim
pullpackage vim-vp4 https://github.com/ngemily/vim-vp4
