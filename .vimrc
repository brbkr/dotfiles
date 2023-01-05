"
" .vimrc
"
set noai			" autoindenting is enabled in autocmd
set   autowrite			" write file if we're going to change buffer
set   backspace=indent,eol,start
set   background=dark
set nobackup			" don't keep a backup file
set   cinoptions=(0		" second line after ( should align after (
set   cmdheight=2		" command height, need at least 2 with quickfix
set nocompatible        	" use VIM stuff over VI stuff
set   expandtab           	" convert hard tabs to spaces
set   hidden                    " 
set   history=50		" keep 50 lines of command line history
set   hlsearch			" highlight search matches
set   ignorecase		" easier searching (ignores case)
set   incsearch			" show search while typing it
set   laststatus=2		" always have a status line
set   lazyredraw		" don't redraw while executing commands
set   ruler			" show the cursor position all the time
set   scrolloff=3               " always show N lines around cursor
set   shiftwidth=4		" this also handles things like c indenting
set   shortmess=atI             " turns off many "Press RETURN to continue.."
set   showcmd			" show command at bottom after executing
set   smartcase			" ignore case unless upper case used (searching)
set   softtabstop=4		" hitting tab gets you 4 spaces
set   tags=./tags,./../tags	" default tags
set   title                     " set xterm titles when editing
set   updatetime=300            " shorter error messages
set   viminfo='20,\"50		" read/write a .viminfo file, don't store more
set   wrap                      " scroll long lines rather than wrapping
"
" Turning off dinging takes some effort
set visualbell          " don't ding
set t_vb=               " really, I mean don't ding, damnit

let mapleader = "_"		" some maps will start with this char

" Misc bindings
map <Leader>jl	:cd %:h<CR>		" cd to the dir of the edit file
map <Leader>d   :call append(line('.'), strftime("%b %d %Y"))<CR>

" filetype specific options
filetype on
filetype indent on
filetype plugin on
if has("autocmd")
 autocmd!
  autocmd FileType perforce	set ai sw=8 sts=8 noet | exe "go " line2byte(29)
  autocmd FileType html         set tw=0 sts=0 ts=8 sw=8 noet ai
  autocmd FileType javascript   set tw=78 sts=2 sw=2
  autocmd FileType cpp          set sw=8 sts=8 et

 augroup filetype
  au BufNewFile,BufRead cdesigner*.log  set ft=cdesigner nowrap
  au BufNewFile,BufRead ccompiler*.log  set ft=cdesigner nowrap
  au BufNewFile,BufRead custom_compiler*.log  set ft=cdesigner nowrap
  au BufNewFile,BufRead 900*.log  set ft=cdesigner nowrap
  au BufNewFile,BufRead input/*.log  set ft=cdesigner nowrap
  au BufNewFile,BufRead go.log  set ft=cdesigner nowrap
  au BufNewFile,BufRead replay.log  set ft=cdesigner nowrap
 augroup END
endif

" Syntax highlighting and indenting
syntax on

" When using a light background, vimdiff's background colors are hard to read
hi DiffAdd      guibg=Green ctermbg=Green guifg=Black ctermfg=Black
hi DiffDelete   guibg=Gray ctermbg=Red guifg=Black ctermfg=Black
hi DiffChange   guibg=#f0f0f0 ctermbg=White guifg=Black ctermfg=Black
hi DiffText     guibg=LightGray ctermbg=LightGray guifg=Black ctermfg=Black

hi SpellBad ctermbg=White ctermfg=Red cterm=undercurl gui=undercurl guifg=Red
hi Search   ctermbg=LightGray ctermfg=Black
hi MatchParen cterm=underline ctermbg=none ctermfg=none
hi Error ctermfg=DarkRed ctermbg=LightGray
hi Todo ctermfg=Yellow ctermbg=LightGray
highlight Visual ctermbg=White

" Use ~/.vimrc-local for site-local customizations
if glob("~/.vimrc-local") != ""
    source ~/.vimrc-local
endif
