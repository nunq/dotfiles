colorscheme monokai
nnoremap <esc> :noh<return><esc>
nnoremap <M-d> <Nop>
nnoremap <M-s> <Nop>

command C :write | !~/.scripts/compile %
command Lenv !zathura (dirname %)/(basename % | sed 's/\.tex//').pdf & 
command W :write

set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set cursorline
set encoding=utf-8
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set magic
set mouse=a
set nocompatible
set number
set scrolloff=5
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set title
set ttyfast
set undolevels=100
syntax on

set statusline=\ %F
set statusline+=\ %h
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=line\ %l\ of\ %L
set statusline+=\ ≈\ %P
