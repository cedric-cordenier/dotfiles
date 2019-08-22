set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'maximbaz/lightline-ale'
Plugin 'raimondi/delimitmate'
Plugin 'mhinz/vim-grepper'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'davidhalter/jedi-vim'
Plugin 'janko-m/vim-test'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'chrisbra/csv.vim'

"
" Language support
"

" Python
Plugin 'hdima/python-syntax'
Plugin 'indentpython.vim'

" Go
Plugin 'fatih/vim-go'

" Coffeescript
Plugin 'kchmck/vim-coffee-script'

" Elixir
Plugin 'elixir-editors/vim-elixir'

call vundle#end()
filetype plugin indent on
syntax on
set number

" allow opening new buffers if current is unsaved
set hidden

" incremental search
set incsearch

set backspace=start,indent,eol

" search into subfolders
set path+=**

" Display matching folders on tab complete
set wildmenu

" Stop delay when pressing ESC in insert mode
set timeoutlen=1000 ttimeoutlen=0

" Colorscheme
colorscheme Tomorrow-Night

" Python highlighting
let g:python_highlight_all = 1

" ALE
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:ale_fixers = {'python': ['autopep8', 'isort', 'trim_whitespace'], 'javascript': ['prettier']}
let g:ale_fix_on_save = 1

let g:ale_linters = {'python': ['flake8']}
let g:ale_lint_on_save = 1

let g:ale_python_autopep8_options = '--max-line-length=100'


" Lightline
set laststatus=2

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'file', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

" Set where splits are opened
set splitright splitbelow

" Netrw configuration
let g:netrw_list_hide='.*\.swp$,.*\.pyc'

" Vim-json config
let g:vim_json_syntax_conceal = 0

" Remap arrow keys in normal and insert mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Simplify split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap // to search for visual selection
vnoremap // y/<C-R>"<CR>"

" Add default indentation for unknown filetypes
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

" Copy to the system clipboard by default
set clipboard=unnamed

" FZF
" Make FZF respect gitignore (requires the_silver_searcher brew package)
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" FZF map to ctrlp
nnoremap <C-P> :FZF<cr>
nnoremap <C-F> :Tags<cr>

" Grepper abbreviations
cmap GW Grepper -query <C-R><C-W>
cmap GQ Grepper -query 
cmap PF !pytest % -s

" Jedi - disable completions because they are annoying
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0
let g:jedi#smart_auto_mappings = 0
