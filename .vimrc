syntax on
set shell=bash
set title
set number
set wrapscan
set backspace=indent,eol,start
set enc=utf-8
set fenc=utf-8
set tabstop=8
set shiftwidth=8
set autoindent
set smartindent
set softtabstop=8

colorscheme desert


" vundle
if !1 | finish | endif

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'VundleVim/Vundle.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'thinca/vim-quickrun'
Bundle 'Townk/vim-autoclose'
Bundle 'grep.vim'
Bundle 'tpope/vim-surround'
Bundle 'Align'
Bundle 'kannokanno/previm'
Bundle 'tyru/open-browser.vim'
Bundle 'taglist.vim'
Bundle 'jimenezrick/vimerl'
Bundle 'vim-erlang/vim-erlang-skeletons'
Bundle 'Shougo/vimproc.vim'
Bundle 'vim-erlang/vim-erlang-tags'

filetype plugin indent on

" nerdtree
map <Leader>n :NERDTree<CR>
map <Leader>N :NERDTreeClose<CR>

" vim-markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.report set filetype=markdown
autocmd FileType markdown set tabstop=4 softtabstop=4 shiftwidth=4

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" erlang
autocmd BufRead,BufNewFile *.erl set filetype=erlang
autocmd FileType erlang set tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufWritePost *.erl call vimproc#system_bg('~/.vim/bundle/vim-erlang-tags/bin/vim-erlang-tags.erl --otp')
