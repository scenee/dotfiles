" ===== vimrc =====

" Basic {{{1

syntax on
set autochdir
set autoindent
set backspace=indent,eol,start
set cursorline
set enc=utf-8
set fenc=utf-8
set hlsearch
set incsearch
set laststatus=2
set list
set listchars=trail:_,eol:¬,tab:▸\ 
set number
set nofoldenable
set shell=bash
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set title
set virtualedit+=block
set wildmenu wildmode=list:full
set wrapscan
"set nowrap 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" }}}1

" Key Mapping {{{1

" General
noremap ; :
noremap : ;
noremap Q gq
noremap <Space>h  ^
noremap <Space>l  $
noremap <Space>n  %
inoremap jk <esc>

" Continuous increment/decrement
if v:version > 705 || (v:version > 704 && has('patch754'))
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv
endif

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Search text selected on visual mode
vnoremap // y/<C-R>"<CR>

set shell=bash
" fix highlights for $(..) in 'sh' script because it was not supported by sh
let g:is_bash = 1

" You can pop a vertical window to display grep results
" 	autocmd QuickFixCmdPost *grep* :vert 100 cwindow
autocmd QuickFixCmdPost *grep* cwindow

" See https://code.google.com/p/mintty/wiki/Tips#Mode-dependent_cursor_in_vim
let &t_ti.="\e[1 q"

" See http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" }}}1

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/Align'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Townk/vim-autoclose'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/grep.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'ervandew/supertab'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/ag.vim'

" Color {{{
Plug 'w0ng/vim-hybrid'
" }}}

" Snippets {{{
if v:version > 700 && (has("python") || has("python3"))
	Plug 'SirVer/ultisnips'
endif
Plug 'honza/vim-snippets'
" }}}

" Status/Tabline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}

" C Plugins {{{
if v:version > 704 || (v:version == 703 && has('patch143'))
	\ && (has("python") || has("python3"))
	" YouCompleteMe require Vim 7.3.885+ with Lua enabled.
	" If you use it on 14.04, See https://github.com/Valloric/YouCompleteMe/issues/2335
	Plug 'Valloric/YouCompleteMe' 
endif

" Required Eexuberant-ctags.
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/gtags.vim'

if has("unix") && system("uname") == "Linux\n"
    Plug 'justmao945/vim-clang'
endif
" }}}

" Erlang plugins {{{
Plug 'jimenezrick/vimerl'
Plug 'vim-erlang/vim-erlang-tags'
" }}}

" D plugins {{{
Plug 'JesseKPhillips/d.vim'
" }}}

" Markdown plugins {{{
Plug 'kannokanno/previm'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" }}}

" Python plugins {{{
Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv'
" }}}

" HTML/JS plugins {{{
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'posva/vim-vue'
" }}}

" Go {{{
Plug 'fatih/vim-go'
" }}}

" PlantUML plugins {{{
Plug 'aklt/plantuml-syntax'
" }}}

" bats plugins {{{
Plug 'vim-scripts/bats.vim'
" }}}

call plug#end()
" }}}

" Plugin settings {{{

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

" ag.vim
nnoremap <leader>a :Ag

" unite.vim

let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

nnoremap <silent> ,e  :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_max_height = 16
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag --hidden --ignore .git -f -g ""'
let g:ctrlp_working_path_mode = 'ra'

" NERDTree
nnoremap <silent> <Leader>1 :NERDTree<CR>

" syntastic
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" snippet
let g:UltiSnipsExpandTrigger="<Leader>s"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" For conceal markers.
if has('conceal')
	let g:tex_conceal=''
"  set conceallevel=2 concealcursor=niv
endif

" gtags
let g:Gtags_OpenQuickfixWindow = 0

" tagbar
nnoremap <silent> <Leader>0 :Tagbar<CR>
let g:tagbar_sort = 0

" vim-airline
let g:airline_powerline_fonts = 1 " Install https://github.com/powerline/fonts
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" open-browser
nmap <Leader>w <Plug>(openbrowser-smart-search)
" let g:netrw_nogx = 1 " disable netrw's gw mapping.
 
" YCM
" If you use pyenv, you have to reinstall a python. See also https://github.com/yyuu/pyenv/issues/99
" ```
" env PYTHON_CONFIGURE_OPTS="--enable-framework CC=clang" pyenv install 3.6.0
" ````
command! YcmCompleter call plug#load('YouCompleteMe') | call youcompleteme#Enable() | YcmCompleter
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
let g:ycm_path_to_python_interpreter = 'python'
endfunction

" surround
autocmd FileType html,htmldjango,css call s:SetSurroundHTML()
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

" Gtags
autocmd FileType c,cpp call s:SetGTAG()

function! s:SetGTAG()
noremap <C-g> :Gtags 
noremap <C-h> :Gtags -f %<CR>
noremap <C-j> :GtagsCursor<CR>
noremap <C-n> :cn<CR>
noremap <C-p> :cp<CR>
endfunction

" jedi-vim
autocmd FileType python call s:SetJedi()
autocmd FileType python setlocal completeopt-=preview

function! s:SetJedi()
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = "<Tab>"  " Prevent conflict with my Spotlight shutcut key on Mac
let g:jedi#usages_command = "<leader>u" " Prevent conflict NERDTreeOpen map 
let g:jedi#goto_command = "<C-j>"
let g:jedi#force_py_version = 3
endfunction

" plantuml-syntax 
let g:plantuml_executable_script = "~/.plantuml/plantuml""

" }}}

" Color {{{1

"colorscheme desert
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette. "
set background=dark
colorscheme hybrid
highlight Visual term=reverse cterm=reverse guibg=Grey

let &colorcolumn=join(range(81,1000),",")
highlight ColorColumn ctermbg=234

" vim-gitgutter color settings
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn

" }}}1

" FileType {{{1

" C
autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8

" bats
autocmd FileType bats setlocal tabstop=2 softtabstop=2 shiftwidth=2

" HTML
autocmd FileType html,htmldjango,css,javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" shell
autocmd FileType sh setlocal tabstop=8 softtabstop=8 shiftwidth=8

" Erlang
autocmd BufRead,BufNewFile *.erl setlocal filetype=erlang
autocmd FileType erlang setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufWritePost *.erl call 
\ vimproc#system_bg('~/.vim/bundle/vim-erlang-tags/bin/vim-erlang-tags.erl --otp')

" Python
autocmd BufRead,BufNewFile *.kv set filetype=python
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" YAML
autocmd BufRead,BufNewFile *.yml set filetype=yaml
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" conf
autocmd BufRead,BufNewFile *.conf set filetype=conf
autocmd FileType conf setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.report set filetype=markdown
autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
let g:vim_markdown_conceal = 0

" }}}1
" 
" vim:foldmethod=marker:foldlevel=0
