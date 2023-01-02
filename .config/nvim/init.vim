colorscheme monokai-grey

" inspiration:
" https://stevelosh.com/blog/2010/09/coming-home-to-vim/#s5-vim-s-feeling
" http://www.viemu.com/a-why-vi-vim.html

nnoremap <esc> :noh<return><esc> " clear out search highlighting
nnoremap <M-d> <Nop>
nnoremap <M-s> <Nop>
map qq <Nop>
nnoremap / /\v
vnoremap / /\v

nnoremap <tab> % " make tab match braces, move faster
vnoremap <tab> %

tnoremap <Esc> <C-\><C-n> " exit terminal mode with esc

inoremap <F1> <ESC> " no help on F1
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

command W :write
command Q :quit
command Wq :write | :quit
command WQ :write | :quit

set nocompatible
syntax on
filetype on
set encoding=utf-8
let mapleader=","

set backspace=indent,eol,start
set clipboard=unnamedplus " xorg ctrl+v clipboard
set cursorline " mark current cursor line
set ruler " cursor position
set title " sets window title
set undolevels=100
set history=500
set background=dark
set mouse=a " enable mouse in all modes
set number " show line numbers
set scrolloff=10 " number of margin scroll lines
set belloff=all " disable bell
set relativenumber
set autochdir

" search and replace
set hlsearch " highlights all search matches
set ignorecase " ignore case in search
set smartcase " override ignorecase when search contains uppercase chars
set incsearch " start search as soon as characters are typed
set magic " enable more regex special chars
set showmatch " show matching braces
set gdefault " /g replace as default

" tabs and indents
set smartindent " works for c-like programs
set softtabstop=2
set tabstop=2
set shiftwidth=2 " all need to be the same
set expandtab " expand to spaces

" statusline
set laststatus=2
set statusline=\ %F
set statusline+=\ %h " help buffer flag
set statusline+=%m " modified flag
set statusline+=%r " read-only flag
set statusline+=%=
set statusline+=line\ %l:%c
set statusline+=\ of\ %L
set statusline+=\ %p%%\ 

" learn proper movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
