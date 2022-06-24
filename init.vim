" Required:
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'navarasu/onedark.nvim'
Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'neoclide/coc.nvim', {'merged':0, 'rev': 'release'}
Plug 'honza/vim-snippets'
Plug 'ellisonleao/glow.nvim'
Plug 'lepture/vim-jinja'
call plug#end()

" Requiredd
filetype plugin indent on
syntax enable
colorscheme onedark
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
nnoremap <Leader>e :NvimTreeToggle<CR>
nnoremap <Leader>rp :terminal perl %<CR>
nnoremap <Leader>rp :terminal go %<CR>
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>tt :TlistToggle<CR>
nnoremap <Leader>s :gt<CR>

au Filetype perl nmap = :PerlTidy<CR>
au Filetype perl vmap = :PerlTidy<CR>

" make command access easy
nnoremap ; :
" inoremap jj <esc>

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
" imap <C-s>     <Plug>(neosnippet_expand_or_jump)
" smap <C-s>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-s>     <Plug>(neosnippet_expand_target)
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <expr><TAB>
" \ pumvisible() ? "\<C-s>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Ale next error
nmap <silent> <leader>an :ALENext<cr>
nmap <silent> <leader>ap :ALEPrevious<cr>
let g:ale_fixers = ['prettier', 'eslint', 'pg_format']
let g:ale_fix_on_save = 1

" turn off tag suggestions in deoplete 
" let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
" let g:deoplete#ignore_sources._ = ['tag']

" dont try to autocomplete sql
let g:ftplugin_sql_omni_key = '<C-j>'

" configure Airline
let g:airline#extensions#tabline#enabled = 1 "show tabs

" enable deoplete
" let g:deoplete#enable_at_startup = 1

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
" sql autoformat
au FileType sql setl formatprg=/usr/local/bin/pg_format\ -

" no visual bell
set visualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=
"
" " Coc
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! CurrentLineInfo()
lua << EOF
local linenr = vim.api.nvim_win_get_cursor(0)[1]
local curline = vim.api.nvim_buf_get_lines(
        0, linenr - 1, linenr, false)[1]
print(string.format("Current line [%d] has %d bytes",
        linenr, #curline))
EOF
endfunction

function! TreeSetup()
lua << EOF
require('nvim-tree').setup {
  open_on_setup = true,
  update_cwd = true,
  respect_buf_cwd = true,
  hijack_netrw = true,
  git = {
    ignore = true,

    },
  renderer = {
    indent_markers = {
      enable = true
    },
    icons = {
      show = {
        git = true,
        folder = true,
        file = true 
      }
    },
    highlight_git = true,
    highlight_opened_files = '1'
  },
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = false
      }
    }
  },
  view = {
    width = 32,
    auto_resize = true
  },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
  },
  git = {
    enable = true,
    ignore = true,
  },
}
EOF
endfunction

call TreeSetup()

let g:coc_snippet_next = '<tab>'

" gutentags
if executable('rg')
  let g:gutentags_file_list_command = 'rg --files'
endif

