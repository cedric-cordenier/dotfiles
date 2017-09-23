set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'elzr/vim-json'
Plugin 'raimondi/delimitmate'
Plugin 'mileszs/ack.vim'

" Language support

" Python
Plugin 'hdima/python-syntax'
Plugin 'indentpython.vim'

" Go
Plugin 'fatih/vim-go'

" Coffeescript
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on
syntax on
set number

set backspace=start,indent,eol

" Stop delay when pressing ESC in insert mode
set timeoutlen=1000 ttimeoutlen=0

" Colorscheme
colorscheme Tomorrow-Night

" Python highlighting
let g:python_highlight_all = 1

" Airline customisations
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ['tabline']

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Set where splits are opened
set splitright splitbelow

" Ctrlp configuration - open as vertical split by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-v>'],
    \ 'AcceptSelection("v")': ['<cr>'],
    \ }

" Ctrlp configuration - custom ignore
let g:ctrlp_custom_ignore = {
   \ 'dir': '\.git$\|frontend$|node_modules|migrations',
   \ 'files': '\.pyc$|\.js$' }

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
set tags=tags;/
