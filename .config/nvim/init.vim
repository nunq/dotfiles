colorscheme monokai-grey
nnoremap <esc> :noh<return><esc>
nnoremap <M-d> <Nop>
nnoremap <M-s> <Nop>
map qq <Nop>

tnoremap <Esc> <C-\><C-n> " exit terminal mode with esc

command W :write
command Q :quit
command Wq :write | :quit
command WQ :write | :quit

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
set scrolloff=10
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
set history=500
set ruler
set background=dark
set ai
set si
syntax on
filetype on

set statusline=\ %F
set statusline+=\ %h
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=line\ %l\ of\ %L
set statusline+=\ ≈\ %P
