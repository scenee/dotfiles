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
set hlsearch
set incsearch
set wildmenu wildmode=list:full
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

colorscheme desert

" See https://code.google.com/p/mintty/wiki/Tips#Mode-dependent_cursor_in_vim
let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[1 q"

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
Bundle 'Shougo/vimproc.vim'
Bundle 'vim-erlang/vim-erlang-tags'


Bundle 'itchyny/lightline.vim'
Bundle 'ctrlpvim/ctrlp.vim'

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

" fix highlights for $(..) in 'sh' script because it was not supported by sh
let g:is_bash = 1

" python
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4
