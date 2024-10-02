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

# 0.53.0 has error: unknown option: --highlight-line
# 0.54.0 has error: unknown option: --wrap-sign
(cd ~/.fzf; git checkout tags/0.52.1)
