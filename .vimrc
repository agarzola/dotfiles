" PLUGINS
" Register plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'

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

" Highlight for color and column
set colorcolumn=81
set cursorline
highlight ColorColumn ctermbg=183

" Wrap on 80 char column
set wrap
set linebreak
set nolist
set textwidth=80
set formatoptions-=t
