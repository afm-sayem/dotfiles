set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'mhinz/vim-startify'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'

call vundle#end()
filetype plugin indent on

syntax enable
colorscheme desert
set background=dark

set expandtab
set smarttab
set ai "Auto Indent
set si "Smart Indent
set wrap "Wrap lines

set shiftwidth=2
set tabstop=2

set nobackup
set ignorecase
set smartcase
set hlsearch
set showmatch

set laststatus=2

set number
" change the mapleader from \ to ,
let mapleader=","

" configure CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" configure Airline
let g:airline#extensions#tabline#enabled = 1 "show tabs


" no need to save backup or swap file
set nobackup
set noswapfile

nnoremap ; :
