" ==============================================================================
" ==============================================================================
" BASIC PREFERENCES
" ==============================================================================
" Set tab size and use spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set backup
set backupdir=/tmp
set directory=/tmp

" Show line and column ruler count
set ruler

" Highlight for color and column
set colorcolumn=81
set cursorcolumn

" Wrap on 80 char column
" set wrap
" set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions-=tro

" Ignore case on commands
set ignorecase

" Display hybrid line numbers
set number
set relativenumber

" Map `jk` to ESC
inoremap jk <ESC>

" Use Ctrl-[hjkl] to navigate splits.
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Fold based on indent.
set foldmethod=manual

" Deepest fold is 10 levels.
set foldnestmax=40

" Don’t fold by default.
set nofoldenable

" Sane line joining.
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" Keep text selected after changing indentation.
vnoremap < <gv
vnoremap > >gv

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

" ==============================================================================
" ==============================================================================
" CUSTOM COMMANDS
" ==============================================================================
" Unminify HMTL.
command UnminifyHTML %s/<[^>]*>/\r&\r/g

" Remove blank lines.
command RemoveBlank %g/^$/d

" Unfuck HTML (unminify & remove blank lines).
function UnfuckHTML ()
  :UnminifyHTML
  :normal gg=G
  :RemoveBlank
  :echo "I did my best to unfuck it, sir."
endfunction
command UnfuckHTML call UnfuckHTML()

" ==============================================================================
" ==============================================================================
" REGISTER PLUGINS AND SET THEIR VARIABLES
" ==============================================================================
call plug#begin('~/.vim/plugged')

" ==============================================================================
" ==============================================================================
" THEME
" ==============================================================================
" Plug 'morhetz/gruvbox'
" 
" " Theme settings
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_cursor_column = '000'
" let g:gruvbox_italicize_comments = 1
" 
" Color overrides
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=000
hi Folded guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=000
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=000
hi MatchParen guibg=NONE ctermbg=000

" ==============================================================================
" ==============================================================================
" SYNTAX HIGHLIGHTING
" ==============================================================================
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'digitaltoad/vim-pug'
Plug 'mattn/emmet-vim'
Plug 'shime/vim-livedown'
let g:livedown_browser = 'firefox'

" Plug 'plasticboy/vim-markdown'
" Indent new list items in markdown by two spaces only
let g:vim_markdown_new_list_item_indent = 2

Plug 'nelstrom/vim-markdown-folding'
" Don’t fold markdown files
let g:vim_markdown_folding_disabled = 1

Plug 'mustache/vim-mustache-handlebars'
Plug 'nelsyeung/twig.vim'
" Plug 'vim-scripts/vim-stylus'

" ==============================================================================
" ==============================================================================
" HELPERS
" ==============================================================================
Plug 'w0rp/ale'
" Set ALE error/warning markers & clear bg color
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '~'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_fixers = {
      \  'javascript': [ 'eslint' ],
      \  'json': [ 'jq' ],
      \}

" Keep ALE column open
let g:ale_sign_column_always = 1

" Set ALE linter delay, in milliseconds
" let g:ale_lint_delay = 800

" Use only eslint for javascript
let g:ale_linters = {
      \  'javascript': [ 'eslint' ],
      \}

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '┆'
let g:indentLine_first_char = '┆'
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0
let g:indentLine_conceallevel=2

Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

Plug 'geekjuice/vim-mocha'

" ==============================================================================
" ==============================================================================
" UI & ENVIRONMENT
" ==============================================================================
Plug 'scrooloose/nerdtree'
" Open NERDtree if directory specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Open NERDtree if no file specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only window left is NERDtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show dotfiles in NERDtree by default
let NERDTreeShowHidden=1

" Enable line numbers in NERDtree.
let NERDTreeShowLineNumbers=1

" Use relative line numbers in NERDtree.
autocmd FileType nerdtree setlocal relativenumber

Plug 'ctrlpvim/ctrlp.vim'
" Ignore directories from ctrlp indexing.
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|\.(git|hg|svn))$',
  \ }

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
" Show errors & warnings in airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 20

Plug 'junegunn/goyo.vim'
" Display line numbers in Goyo
let g:goyo_linenr = 1

Plug 'jeffkreeftmeijer/vim-numbertoggle'

" ==============================================================================
" ==============================================================================
" INITIALIZE PLUGINS
" ==============================================================================
call plug#end()

" Set theme, now that it’s been properly loaded.
" (Can’t set the colorscheme variable until Plug has initialized.)
" colorscheme gruvbox
