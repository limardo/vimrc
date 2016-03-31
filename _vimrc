set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'

call vundle#end()
filetype plugin indent on

" Common
set t_CO=256
scriptencoding utf-8
set encoding=utf-8

syntax on
let mapleader=','

colorscheme molokai

" Settings
set number
set cursorline
set backspace=indent,eol,start
set linespace=15

set hlsearch
set incsearch

set nowrap

set tabstop=2
set softtabstop=2
set shiftwidth=2

set splitbelow
set splitright

set showtabline=2
set scrolloff=15

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Mappings
nmap <Leader>l :nohlsearch<cr>
nmap <Leader>p :CtrlPMRUFiles<cr>
nmap <Leader><C-P> :CtrlPBufTag<cr>

nmap <Leader>1 :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

nmap <C-Z> :undo<cr>
nmap <Leader>w :tabclose<cr>

" Auto-Commands
augroup autosourcing
	autocmd!
	autocmd BufWritePost _vimrc source %
	autocmd BufWritePost _gvimrc source %
	autocmd BufWritePost .vimrc source %
augroup END

" NERDTree
let NERDTreeHijackNetrw=1

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

let g:ctrp_map = '<C-P>'
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" Ag
set grepprg=ag
let g:grep_cmd_ops = '--line-numbers --noheading'
let g:ag_working_path_mode = 'r'
