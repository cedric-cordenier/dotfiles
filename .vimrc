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
Plugin 'janko-m/vim-test'
Plugin 'chrisbra/csv.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }

"
" Language support
"

" Go
Plugin 'fatih/vim-go'

call vundle#end()

filetype plugin indent on
syntax on
set number

let mapleader=" "
map <Leader> <Plug>(easymotion-prefix)

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

" ALE
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'go': ['gofmt', 'remove_trailing_lines', 'trim_whitespace', 'goimports'],
  \ }
let g:ale_fix_on_save = 1

let g:ale_linters = {
  \ 'ruby': ['brakeman', 'rails_best_practices', 'reek', 'rubocop', 'ruby', 'solargraph', 'standardrb'],
  \ 'go': ['gofmt', 'gobuild'],
  \ }
let g:ale_lint_on_save = 1

let g:ale_ruby_rubocop_executable = 'bundle'

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
let g:netrw_altv=1
let g:netrw_rmdir_cmd='rm -r'

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
nnoremap <C-G> :Ag<cr>

" Grepper abbreviations
cmap GW Grepper -noprompt -query <C-R><C-W><CR>
cmap GQ Grepper -noprompt -query
cmap PF !pytest % -s
cmap RF terminal bundle exec rspec %
cmap GT GoTest

" LanguageClient
let g:LanguageClient_serverCommands = {
  \ 'ruby': ['/usr/local/bin/solargraph', 'stdio'],
  \ 'go': ['gopls'],
 \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" Allow % to work with do end blocks
runtime! macros/matchit.vim

" Get path + current line and copy it
"
cmap CL echo @% . ':' . line('.')<CR>

cmap GS ?import (<Esc>o"github.com/davecgh/go-spew/spew"<Esc><CR>

let g:LanguageClient_loggingFile =  expand('~/tmp/nvim/LanguageClient.log')
