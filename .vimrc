" PLUGINS
" Register plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'agarzola/dracula-vim'
Plug 'emhaye/ceudah.vim'
Plug 'baines/vim-colorscheme-thaumaturge'
Plug 'kudabux/vim-srcery-drk'
Plug 'smancill/darkglass'
Plug 'broduo/broduo-color-scheme'
Plug 'zanglg/nova.vim'

" Plugins
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'nelsyeung/twig.vim'
Plug 'vim-scripts/vim-stylus'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'scrooloose/nerdcommenter'
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-dispatch'
Plug 'mustache/vim-mustache-handlebars'
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

" Colors & theme
set termguicolors
colorscheme srcery-drk

" PLUGIN OPTIONS
" IndentLine
let g:indentLine_char = '┆'
let g:indentLine_first_char = '┆'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_conceallevel=2

" NERDcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Indent new list items in markdown by two spaces only
let g:vim_markdown_new_list_item_indent = 2

" Don’t fold markdown files
let g:vim_markdown_folding_disabled = 1

" Automatically generate markdown preview
let vim_markdown_preview_toggle=3

" Use GitHub-flavored markdown for previews
let vim_markdown_preview_github=1

" Use Chrome for markdown previews
let vim_markdown_preview_browser='Google Chrome'

" Use eslint for linting JS
let g:syntastic_javascript_checkers=['eslint']

" PERSONAL PREFERENCES
" Set tab size and use spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set backup
set backupdir=/tmp
set directory=/tmp

" Show line and column ruler count
set ruler

" Highlight for color and column
set colorcolumn=81
set cursorline
highlight ColorColumn ctermbg=183

" Color overrides
highlight MatchParen guibg=#5C6773

" Wrap on 80 char column
" set wrap
" set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions-=tro

" Ignore case on commands
set ignorecase

" Display line numbers
set number

" Map `jk` to ESC
inoremap jk <ESC>

" CUSTOM COMMANDS
" Unminify HMTL
command UnminifyHTML %s/<[^>]*>/\r&\r/g
command RemoveBlank %g/^$/d

function UnfuckHTML ()
  :UnminifyHTML
  :normal gg=G
  :RemoveBlank
  :echo "I did my best to unfuck it, sir."
endfunction
command UnfuckHTML call UnfuckHTML()

" Open NERDtree if directory specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Open NERDtree if no file specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only window left is NERDtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show dotfiles in NERDtree by default
let NERDTreeShowHidden=1

" Set syntax to PHP for common Drupal file extensions
augroup module
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
augroup END
