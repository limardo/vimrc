set t_Co=256

scriptencoding utf-8
set encoding=utf-8

set history=256
set timeoutlen=250 
set clipboard+=unnamed
set shiftround
set tags=.git/tags;$HOME

set modeline
set modelines=5

set autowrite
set autoread

set hidden

set hlsearch
set ignorecase
set smartcase
set incsearch

let g:is_posix = 1
let mapleader = ','
let maplocalleader = ' '
let g:netrw_banner = 0

set fo+=o 
set fo-=r
set fo-=t

set nowrap
set textwidth=0

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

syntax on

"set mouse=a
"set mousehide

set number
set showmatch
set matchtime=2

set wildmode=longest,list

set completeopt+=preview

set novisualbell
set noerrorbells
set vb t_vb=

set laststatus=2
set shortmess=atI
set showcmd

set statusline=%<%f\
set stl+=[%{&ff}]
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

set foldenable
set foldmethod=marker
set foldlevel=100

set foldopen=block,hor,tag
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block

set splitbelow
set splitright

"set list
set listchars=tab:\ ·,eol:•
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>


filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Utility
Plugin 'majutsushi/tagbar'

" Theme
Plugin 'tomasr/molokai'

" Statusbar
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Colorscheme
colorscheme molokai
let g:rehash256=1

" Utility
autocmd FileType php,js,css,html,tpl,py,rb,alias nested :TagbarOpen
map <silent> <F11> :TagbarToggle<CR>

" Statusbar
let g:Powerline_symbols = "fancy"

let g:airline_section_a = airline#section#create(['%<', 'file', 'readonly'])
let g:airline_section_b = ''
let g:airline_section_c = ''
let g:airline_section_gutter = airline#section#create(['%=%y%m%r[%{&ff}]'])
let g:airline_section_x = ''
let g:airline_section_z = airline#section#create(['%(%l,%c%V%) %P'])
let g:airline_section_warning = ''
