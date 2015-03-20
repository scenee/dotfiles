syntax on
set shell=bash
set title
set number
set wrapscan
set backspace=indent,eol,start
set enc=utf-8
set fenc=utf-8

" vundle
if !1 | finish | endif

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'thinca/vim-quickrun'
Bundle 'Townk/vim-autoclose'
Bundle 'grep.vim'

filetype plugin indent on

" nerdtree
map <Leader>n :NERDTree<CR>
map <Leader>N :NERDTreeClose<CR>
