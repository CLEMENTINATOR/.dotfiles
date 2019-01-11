set nocompatible
filetype off
:let mapleader = "<space>"
call plug#begin('~/.vim/plugged')
" Fuzzy file finder
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
" nice status line
Plug 'vim-airline/vim-airline'
" git integration
Plug 'tpope/vim-fugitive'
" git status in the gutter
Plug 'airblade/vim-gitgutter'
" LSP support
Plug 'autozimu/LanguageClient-neovim', {'branch':'next', 'do': 'make release'}
" async completion framework
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
" cool color theme
Plug 'micha/vim-colors-solarized'
call plug#end()

set number
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase
autocmd BufWritePre * :%s/\s\+$//e " Erase endline spaces
set showmatch
set mat=2
set colorcolumn=120
syntax on
syntax sync minlines=256
set synmaxcol=2048
set autoindent
set smartindent
set fileformats=unix,dos,mac
set hidden
set completeopt-=preview
" PLUGIN CONF
" use ag to find files/ in files
" while FZF file finding, use these bindigns to open in a new split/tab
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" LSP configuration
let g:LanguageClient_serverCommands = {
  \ 'python': ['pyls', '-v'],
  \ 'c': ['ccls', '--init={"cache": {"directory": "/tmp/ccls-cache"}}'],
  \ 'cpp': ['ccls','--init={"cache": {"directory": "/tmp/ccls-cache"}}'],
  \ }
" no diagnostic from LSP
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_completionPreferTextEdit = 1
let g:deoplete#enable_at_startup = 1
" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

" BINDINGS MAPPING
nnoremap <silent> <F12> :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F10> :call LanguageClient_textDocument_references()<CR>
nnoremap <c-g> :FZF<cr>
nnoremap ² <c-o>
