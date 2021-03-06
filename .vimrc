" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'

" Browse
Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Search
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'limardo/vim-react-snippets'

" Utils
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'Chiel92/vim-autoformat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'

" Statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Generic
Plugin 'sheerun/vim-polyglot'
Plugin 'mattn/emmet-vim'

" Php
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'

" Javascript
Plugin 'vim-scripts/JavaScript-Indent'

" Scss
Plugin 'cakebaker/scss-syntax.vim'

" Css
Plugin 'hail2u/vim-css3-syntax'

" Fonts
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on

" Common
set t_CO=256
scriptencoding utf-8
set encoding=utf-8

syntax on
let mapleader=','

colorscheme dracula

" Settings
set ruler
set hidden
set number
set cursorline
set lazyredraw
set backspace=indent,eol,start

set noerrorbells visualbell t_vb=
set autowriteall
set complete=.,w,b,u

set hlsearch
set incsearch

set ignorecase
set smartcase
set autoindent
set nowrap

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

set laststatus=2

set splitbelow
set splitright

set showtabline=0
set scrolloff=4

set noswapfile
set shellslash

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Mappings
nmap <Leader>vi :tabedit $MYVIMRC<cr>
nmap <Leader>gv :tabedit $MYGVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>p :CtrlPMRUFiles<cr>
nmap <Leader>pp :CtrlPMixed<cr>
nmap <Leader><C-P> :CtrlPBufTag<cr>

nmap <Leader>1 :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

nnoremap ª :m .+1<CR>==
nnoremap º :m .-2<CR>==
vnoremap ª :m '>+1<CR>gv=gv
vnoremap º :m '<-2<CR>gv=gv

nmap <D-¬> gg=G<CR>:retab<CR>:RemoveTrailingSpaces<CR>

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

autocmd FileType nerdtree setlocal nolist

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

autocmd VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_map = '<C-P>'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\git'

" Greplace.vim
set grepprg=ag
let g:grep_cmd_ops = '--line-numbers --noheading'
let g:ag_working_path_mode = 'r'

" Vim-autoformat
let g:formatdef_jsbeautify_javascript = '"js-beautify -X -j -p -f - -".(&expandtab ? "s ".shiftwidth() : "t").(&textwidth ? " -w ".&textwidth : "")'
let g:formatdef_htmlbeautify = '"html-beautify -f - -I -S -w -A -i -E ".shiftwidth()'

" Php.vim
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

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
let g:php_cs_fixer_fixers_list = "align_equals,align_double_arrow,short_array_syntax,return,new_with_braces"

nnoremap <Silent><Leader>pf :call PhpCsFixerFixFile()<CR>

" pdv
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Vim-statusline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'

" Javascript-libreries-syntax
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,angularui,angularuirouter,react,flux,requirejs,handlebars'

" Vim-jsx
let g:jsx_ext_required = 0

" Vim-devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 0

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
