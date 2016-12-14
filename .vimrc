" ===== vimrc =====

" ----- Basic -----

syntax on
set shell=bash
set title
set number
set wrapscan
set backspace=indent,eol,start
set enc=utf-8
set fenc=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set smartcase
set hlsearch
"set nowrap 
set incsearch
set wildmenu wildmode=list:full
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set list
set listchars=trail:_,eol:¬,tab:▸\ 
set foldmethod=marker
set nofoldenable 
set virtualedit+=block

" ------- Plugins --------

set shell=bash

if !1 | finish | endif

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'VundleVim/Vundle.vim'

Bundle 'Align'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'Townk/vim-autoclose'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'grep.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-surround'
Bundle 'tyru/open-browser.vim'

" snippet
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'

" if v:version > 700 && (has("python") || has("python3"))
" 	Bundle 'SirVer/ultisnips'
" endif
" 
" Bundle 'honza/vim-snippets'

" status/tabline 

Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" c plugins

"" NeoComplete has problem in python completion.
"if has("lua") && v:version > 703 || v:version == 703 && has('patch885')
	"" NeoComplete requires Vim 7.3.885+ with Lua enabled.
	"Bundle "Shougo/neocomplete.vim"
"endif
if v:version > 704 || (v:version == 703 && has('patch143'))
	\ && (has("python") || has("python3"))
	" YouCompleteMe require Vim 7.3.885+ with Lua enabled.
	" If you use it on 14.04, See https://github.com/Valloric/YouCompleteMe/issues/2335
	Bundle 'Valloric/YouCompleteMe' 
endif

" Required Eexuberant-ctags.
Bundle 'taglist.vim'
Bundle 'vim-scripts/gtags.vim'

if has("unix") && system("uname") == "Linux\n"
    Bundle 'justmao945/vim-clang'
endif

" erlang plugins

Bundle 'jimenezrick/vimerl'
Bundle 'vim-erlang/vim-erlang-tags'

" d plugins

Bundle 'JesseKPhillips/d.vim'

" markdown plugins

Bundle 'kannokanno/previm'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'

" python plugins

Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'

" html plugins

Bundle 'othree/html5.vim'
Bundle 'mattn/emmet-vim'

" plantuml plugins

Bundle "aklt/plantuml-syntax"

filetype plugin indent on

" ----- Plugin settings -----

" quickrun.vim 

let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
\   'split': ':botright 16sp',
\   'hook/time/enable': '1',
\   'runner'    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'outputter' : 'error',
\   'outputter/error/success' : 'buffer',
\   'outputter/error/error'   : 'quickfix',
\   'outputter/buffer/close_on_empty' : 1,
\}

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_max_height = 16
let g:ctrlp_clear_cache_on_exit = 0

" NERDTree

nnoremap <silent> <Leader>f :NERDTree<CR>
nnoremap <silent> <Leader>F :NERDTreeClose<CR>

" syntastic

let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" snippet
" let g:UltiSnipsExpandTrigger="<Leader>p"
" 
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" gtags
let g:Gtags_OpenQuickfixWindow = 0

" tagbar
nnoremap <silent> <Leader>0 :Tagbar<CR>

" vim-airline

let g:airline_powerline_fonts = 1 " Install https://github.com/powerline/fonts
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" open-browser

" let g:netrw_nogx = 1 " disable netrw's gw mapping.
nmap <Leader>w <Plug>(openbrowser-smart-search)

" NeoComplete
"let g:neocomplete#enable_at_startup = 1
"let g:vim_markdown_folding_disabled = 1
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" YCM

autocmd FileType * call s:SetYCM()
function! s:SetYCM()
let g:ycm_global_ycm_extra_conf = 
\ '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" See [Using Vim with Django](https://code.djangoproject.com/wiki/UsingVimWithDjango)

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_python_binary_path = 'python'
endfunction

" surround

autocmd FileType html,css call s:SetSurroundHTML()
function! s:SetSurroundHTML()
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\n\r\n{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\n\r\n{% else %}\n{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}""
endfunction

autocmd FileType python call s:SetSurroundPython()

function! s:SetSurroundPython()
	let b:surround_{char2nr("c")} = "\"\"\"\r\"\"\""
endfunction

autocmd FileType markdown call s:SetSurroundMarkdown()

function! s:SetSurroundMarkdown()
	let b:surround_{char2nr("*")} = "**\r**"
	let b:surround_{char2nr("_")} = "__\r__"
endfunction

" jedi-vim

autocmd FileType python call s:SetJedi()

function! s:SetJedi()
let g:jedi#completions_command = "<M-Space>"  " Prevent conflict with my Spotlight shutcut key on Mac
let g:jedi#usages_command = "<leader>u" " Prevent conflict NERDTreeOpen map 
""let g:jedi#force_py_version = 3
""autocmd FileType python setlocal completeopt-=preview
endfunction

" plantuml-syntax 

autocmd FileType plantuml call s:SetPlantUML()

function! s:SetPlantUML()
let g:plantuml_executable_script = "~/.plantuml/plantuml""
endfunction

" ----- Color -----

colorscheme desert
let &colorcolumn=join(range(81,1000),",")
highlight ColorColumn ctermbg=234

" vim-gitgutter color settings
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn

" ----- FileType -----

" vim-markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.report set filetype=markdown
autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
let g:vim_markdown_conceal = 0

" c
autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8

" shell
autocmd FileType sh setlocal tabstop=8 softtabstop=8 shiftwidth=8

" erlang
autocmd BufRead,BufNewFile *.erl setlocal filetype=erlang
autocmd FileType erlang setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufWritePost *.erl call 
\ vimproc#system_bg('~/.vim/bundle/vim-erlang-tags/bin/vim-erlang-tags.erl --otp')

" python
autocmd BufRead,BufNewFile *.kv set filetype=python
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" YAML
autocmd BufRead,BufNewFile *.yml set filetype=yaml
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" ----- Key Mapping -----

" General
noremap ; :
noremap : ;
noremap Q gq
noremap <Space>h  ^
noremap <Space>l  $
noremap <Space>n  %


" Gtags
noremap <C-g> :Gtags 
noremap <C-h> :Gtags -f %<CR>
noremap <C-j> :GtagsCursor<CR>
noremap <C-n> :cn<CR>
noremap <C-p> :cp<CR>

" Search text selected on visual mode
vnoremap // y/<C-R>"<CR>

" ----- Others -----

" You can pop a vertical window to display grep results
" 	autocmd QuickFixCmdPost *grep* :vert 100 cwindow
autocmd QuickFixCmdPost *grep* cwindow

" See https://code.google.com/p/mintty/wiki/Tips#Mode-dependent_cursor_in_vim
let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[1 q"
"
" fix highlights for $(..) in 'sh' script because it was not supported by sh
let g:is_bash = 1

" change the current dir automatically
" See: http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


