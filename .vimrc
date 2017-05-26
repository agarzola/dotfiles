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

" Initialize plugin system
call plug#end()

" PLUGIN OPTIONS
" Colors & theme
set termguicolors
let ayucolor='mirage'
colorscheme ayu

" Color overrides
highlight MatchParen guibg=#5C6773

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

" Wrap on 80 char column
set wrap
set linebreak
set nolist
set textwidth=80
set formatoptions-=t

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
