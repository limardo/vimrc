" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ervandew/supertab'
Plugin 'stephpy/vim-php-cs-fixer'

call vundle#end()
filetype plugin indent on

" Common
set t_CO=256
scriptencoding utf-8
set encoding=utf-8

syntax on
let mapleader=','

colorscheme atom-dark-256

" Settings
set number
set cursorline
set backspace=indent,eol,start
set linespace=12

set noerrorbells visualbell t_vb=
set autowriteall
set complete=.,w,b,u

set hlsearch
set incsearch

set nowrap

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

set splitbelow
set splitright

set showtabline=0
set scrolloff=15

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Mappings
nmap <Leader>vi :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>p :CtrlPMRUFiles<cr>
nmap <Leader>pp :CtrlPMixed<cr>
nmap <Leader><C-P> :CtrlPBufTag<cr>

nmap <Leader>1 :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

nmap <C-Z> :undo<cr>
nmap <Leader>w :tabclose<cr>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Auto-Commands
augroup autosourcing
	autocmd!
	autocmd BufWritePost .gvimrc source %
	autocmd BufWritePost .vimrc source %
augroup END

" NERDTree
let NERDTreeHijackNetrw = 0

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_map = '<C-P>'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\git'

" Greplace.vim
set grepprg=ag
let g:grep_cmd_ops = '--line-numbers --noheading'
let g:ag_working_path_mode = 'r'

" Php.vim
"function! PhpSyntaxOverride()
"  hi! def link phpDocTags  phpDefine
"  hi! def link phpDocParam phpType
"endfunction

"augroup phpSyntaxOverride
"  autocmd!
"  autocmd FileType php call PhpSyntaxOverride()
"augroup END

" Vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" Vim-php-cs-fixer
let g:php_cs_fixer_level = "psr2" 

nnoremap <Silent><Leader>pcf :call PhpCsFixerFixFile()<CR>
