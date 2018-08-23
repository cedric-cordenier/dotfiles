set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'raimondi/delimitmate'
Plugin 'mhinz/vim-grepper'
Plugin 'junegunn/fzf'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'aserebryakov/vim-todo-lists'

" Language support

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

" Add default indentation for unknown filetypes
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

" FZF
" Make FZF respect gitignore (requires the_silver_searcher brew package)
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" FZF map to ctrlp
nnoremap <C-P> :FZF<cr>

" Specify location of tags:
" For each project in ~/Developer the tags are
" located at ~/Developer/.<project-name>-tags
let g:projectsDir = $HOME."/Developer/"
if getcwd() =~ g:projectsDir
  let g:currentProject = split(getcwd(), '/')[3]
  let g:currentProjectTags = g:projectsDir.".".g:currentProject."-tags"
  if filereadable(g:currentProjectTags)
    let &tags=g:currentProjectTags
  endif
endif
