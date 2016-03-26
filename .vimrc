set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'dhruvasagar/vim-prosession'
" Plugin 'klen/python-mode'
" Plugin 'marijnh/tern_for_vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
" Plugin 'burnettk/vim-angular'
Plugin 'einars/js-beautify'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'marijnh/tern_for_vim'
" Plugin 'mhinz/vim-startify'
Plugin 'moll/vim-node'
" Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

call vundle#end()


filetype plugin indent on

syntax enable
set background=dark
colorscheme Tomorrow-Night-Eighties

set expandtab
set smarttab
set ai "Auto Indent
set si "Smart Indent
set wrap "Wrap lines
set hidden

set shiftwidth=2
set tabstop=2

set hlsearch
set ignorecase
set nobackup
set showmatch
set smartcase

set laststatus=2

set number
" change the mapleader from \ to space
let mapleader="\<Space>"

" leader remaps
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>n <C-^>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>e :Lexplore<CR>

" make command access easy
nnoremap ; :
inoremap jj <esc>

" configure CtrlP
let g:ctrlp_use_caching = 0

" A better search for ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

" netrw Default to tree mode
let g:netrw_liststyle = 3


" configure Airline
let g:airline#extensions#tabline#enabled = 1 "show tabs

" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" youcompleteme error
let g:ycm_cache_omnifunc = 0
" no need to save backup or swap file
set nobackup
set noswapfile

" share clipboard with system
set clipboard=unnamed
" set up column guide
" highlight colorcolumn ctermbg=3
" set colorcolumn=80

" close scratch when a selection is made
autocmd CompleteDone * pclose

" no visual bell
set visualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" activate default matchit plugin for html tag nav
runtime macros/matchit.vim

"backspace does not work in insert mode
" set backspace=indent,eol,start
