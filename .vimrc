set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hdima/python-syntax'
Plugin 'indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype plugin indent on
syntax on
colorscheme Tomorrow-Night
set relativenumber
set number
set cursorline

set backspace=start,indent,eol

" Settings for file explorer
let g:netrw_liststyle = 3
let g:netrw_browsesplit = 2

" Python highlighting
let g:python_highlight_all = 1

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

" Powerline fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1

" Remap arrow keys in normal and insert mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
