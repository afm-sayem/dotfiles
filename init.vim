" Required:
set runtimepath+=/Users/sayemafm/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/sayemafm/.cache/dein')
  call dein#begin('/Users/sayemafm/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/sayemafm/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})

  " Add or remove your plugins here like this:
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('jeetsukumaran/vim-buffergator')
  call dein#add('kien/ctrlp.vim')
  call dein#add('martinda/Jenkinsfile-vim-syntax')
  call dein#add('posva/vim-vue')
  call dein#add('rking/ag.vim')
  call dein#add('ssoriche/perltidy.vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-sensible')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-perl/vim-perl')
  call dein#add('vim-scripts/taglist.vim')
  call dein#add('w0rp/ale')
  " call dein#add('SirVer/ultisnips')
  call dein#add('ludovicchabant/vim-gutentags')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
set nocompatible

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
nnoremap <Leader>r :terminal perl %<CR>
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>tt :TlistToggle<CR>
nnoremap <Leader>s :gt<CR>

au Filetype perl nmap = :PerlTidy<CR>
au Filetype perl vmap = :PerlTidy<CR>

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
let g:netrw_winsize=30

" neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
\ pumvisible() ? "\<C-s>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" turn off tag suggestions in deoplete 
" let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
" let g:deoplete#ignore_sources._ = ['tag']

" dont try to autocomplete sql
let g:ftplugin_sql_omni_key = '<C-j>'

" configure Airline
let g:airline#extensions#tabline#enabled = 1 "show tabs

" enable deoplete
let g:deoplete#enable_at_startup = 1

" enable matchit
" let loaded_matchit = 1
" runtime macros/matchit.vim

" no need to save backup or swap file
set nobackup
set noswapfile

" share clipboard with system
set clipboard=unnamed

" close scratch when a selection is made
autocmd CompleteDone * pclose

" sync vue
autocmd FileType vue syntax sync fromstart

" no visual bell
set visualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" gutentags
if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
endif

