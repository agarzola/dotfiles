" PLUGINS
" Register plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'lumiliet/vim-twig'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Initialize plugin system
call plug#end()

" PLUGIN OPTIONS
" Colors & theme
set termguicolors
let ayucolor='mirage'
colorscheme ayu

" IndentLine
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" PERSONAL PREFERENCES
" Set tab size and use spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set backup
set backupdir=/tmp
set directory=/tmp

" Highlight for color and column
set colorcolumn=81
set cursorline
highlight ColorColumn ctermbg=183

" Color overrides
highlight MatchParen guibg=#5C6773

" Wrap on 80 char column
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions-=tro

" Ignore case on commands
set ignorecase

" Display line numbers
set number

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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only window left is NERDtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show dotfiles in NERDtree by default
let NERDTreeShowHidden=1

" Drupal *.module and *.install files.
augroup module
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
augroup END
