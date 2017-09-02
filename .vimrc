set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'hdima/python-syntax'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'

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
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Powerline fonts
let g:airline_powerline_fonts = 1
