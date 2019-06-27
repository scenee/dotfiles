"===================== SETTINGS ======================
" {{{

syntax on
syntax sync minlines=256
set autochdir
set autoindent
set backspace=indent,eol,start
set enc=utf-8
set fenc=utf-8
set hlsearch
set incsearch
set laststatus=2
set list
set listchars=trail:_,eol:¬,tab:▸\ 
set nocursorline  " cursorline make vim slow with highlighting
set nofoldenable
set number
set shell=bash
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set shell=bash
set spell
set spelllang=en,cjk
set splitright
set tabstop=4
set title
set virtualedit+=block
set wildmenu wildmode=list:full
set wrapscan
"set nowrap 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" }}} 
" ===================== MAPPINGS ======================
" {{{

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
" timestamp
nnoremap <silent> ,dt :r !date "+\%Y-\%m-\%dT\%H:\%M:\%S\%z"<CR>
" fix highlights for $(..) in 'sh' script because it was not supported by sh
let g:is_bash = 1
" You can pop a vertical window to display grep results
"     autocmd QuickFixCmdPost *grep* :vert 100 cwindow
autocmd QuickFixCmdPost *grep* cwindow
" See https://code.google.com/p/mintty/wiki/Tips#Mode-dependent_cursor_in_vim
let &t_ti.="\e[1 q"
" See http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" }}}
"===================== PLUGINS ======================
" {{{
call plug#begin('~/.vim/plugged')

" Basic
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Townk/vim-autoclose'
Plug 'Yggdroot/indentLine'
Plug 'cohama/lexima.vim'
Plug 'corylanou/vim-present', {'for' : 'present'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'vim-scripts/grep.vim'
Plug 'w0rp/ale'
Plug 'severin-lemaignan/vim-minimap'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'


" Completion

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Snippets
"" <<< UltiSnips causes many bugs >>>
" if v:version > 700 && (has("python") || has("python3"))
"     Plug 'SirVer/ultisnips'
" endif
" Plug 'honza/vim-snippets'


" Color
Plug 'tomasr/molokai'

" Tags
" Plug 'airblade/vim-rooter' " Must be before vim-easytags
Plug 'vim-scripts/taglist.vim' " Required Eexuberant-ctags.
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'vim-scripts/gtags.vim'
"
" Status/Tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" C/C++
Plug 'ericcurtin/CurtineIncSw.vim'

" Erlang
Plug 'jimenezrick/vimerl'
Plug 'vim-erlang/vim-erlang-tags'

" D
Plug 'JesseKPhillips/d.vim'

" Markdown
Plug 'kannokanno/previm'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Python plugins
Plug 'davidhalter/jedi-vim'
" Plug 'jmcantrell/vim-virtualenv'

" HTML/JS plugins
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }


" HashiVim
Plug 'hashivim/vim-terraform'

" Go
Plug 'fatih/vim-go'

" Swift
Plug 'keith/swift.vim'

" PlantUML
Plug 'aklt/plantuml-syntax'

" bats
Plug 'vim-scripts/bats.vim'

call plug#end()
" }}}
"===================== COLOR ======================
" {{{

set background=dark
set t_Co=256
" "If you prefer the scheme to match the original monokai background color,
" let g:molokai_original = 1 
let g:rehash256 = 1
colorscheme molokai

let &colorcolumn=join(range(81,1000),",")
highlight ColorColumn ctermbg=235

" vim-gitgutter color settings
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn


" }}}
"===================== REGISTRATIONS ======================
" {{{


"" Use directory with package.json as root
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'javascript support using typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
        \ 'whitelist': ['javascript', 'javascript.jsx'],
        \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" }}}
"===================== PLUGIN SETTINGS ======================
" {{{

" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
" let g:ale_lint_on_text_changed = 0
autocmd QuitPre * if empty(&bt) | lclose | endif  " Auto-close the error list. Ref Issue#1306

" CurtineIncSw.vim
autocmd FileType c,cpp nnoremap <S-J> :call CurtineIncSw()<CR>


" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_depth = 10
let g:ctrlp_max_height = 16
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'rg %s --files --hidden --color=never -g "!.git"'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 1

" emmet.vim
let g:emmet_html5 = 0 " Self-closing tag is needed.
let g:user_emmet_install_global = 0
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_leader_key='<C-Y>'
autocmd FileType html,htmldjango EmmetInstall


" HashiVim
let g:terraform_align=1


" jedi-vim
autocmd FileType python call s:SetJedi()
autocmd FileType python setlocal completeopt-=preview

function! s:SetJedi()
let g:jedi#completions_enabled = 0
" let g:jedi#completions_command = "<Tab>"  " Prevent conflict with my Spotlight shutcut key on Mac
let g:jedi#usages_command = "<leader>u" " Prevent conflict NERDTreeOpen map 
let g:jedi#goto_command = "<C-j>"
let g:jedi#force_py_version = 3
endfunction


" gtags
let g:Gtags_OpenQuickfixWindow = 0
autocmd FileType c,cpp call s:SetGTAG()

function! s:SetGTAG()
noremap <C-g> :Gtags 
noremap <C-h> :Gtags -f %<CR>
noremap <C-j> :GtagsCursor<CR>
noremap <C-n> :cn<CR>
noremap <C-p> :cp<CR>
endfunction

" Minimap
let g:minimap_highlight='Visual'
let g:minimap_toggle='<leader>mt'


" NERDTree
nnoremap <silent> <Leader>1 :NERDTreeToggle<CR>
" let g:NERDTreeQuitOnOpen = 1  " Not working...
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeSortHiddenFirst = 1
let g:NERDTreeSortOrder = ['README\.md$', '\.git.*$', '\/$', '*']


" open-browser
nmap <Leader>w <Plug>(openbrowser-smart-search)
" let g:netrw_nogx = 1 " disable netrw's gw mapping.


" plantuml-syntax
let g:plantuml_executable_script = "~/.plantuml/plantuml""


" quickrun.vim
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
\   'split': ':botright 16sp',
\   'hook/time/enable': '1',
\   'runner'    : 'vimproc',
\   'runner/vimproc/updatetime' : 60,
\   'runner/python' : 60,
\   'outputter' : 'error',
\   'outputter/error/success' : 'buffer',
\   'outputter/error/error'   : 'quickfix',
\   'outputter/buffer/close_on_empty' : 1,
\}
let g:quickrun_config.python = { 'command': 'python3' }

au FileType qf nnoremap <silent><buffer>q :quit<CR>
let g:quickrun_no_default_key_mappings = 1
nnoremap \R :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap \R :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


"
"" UltiSnips
" let g:UltiSnipsExpandTrigger="<Leader>s"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" " For conceal markers.
" if has('conceal')
"     let g:tex_conceal=''
" "  set conceallevel=2 concealcursor=niv
" endif


" surround.vim
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


" tagbar
nnoremap <silent> <Leader>0 :Tagbar<CR>
let g:tagbar_sort = 0


" unite.vim
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

nnoremap <silent> ,e  :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,gg :<C-u>Unite grep/git:/:--cached -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR
let s:unite_ignore_directory_patterns=
      \ ''
      \ .'vendor/bundle\|.bundle/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/'
if executable('rg')
  let g:unite_source_grep_command = 'rg'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


" vim-airline
let g:airline_theme = "tomorrow"
let g:airline_powerline_fonts = 1 " Install https://github.com/powerline/fonts
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" indentLine
let g:indentLine_color_term = 251
let g:indentLine_setConceal = 0


" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_toc_autofit = 1
autocmd FileType markdown call s:SetMarkDown()
function! s:SetMarkDown()
nnoremap <silent> <Leader>0 :Toc<CR>
endfunction


" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" vim-easytag
let g:easytags_file = '~/.vim/tags'
let g:easytags_async = 1
let g:easytags_always_enabled = 0
let g:easytags_include_members = 1


" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1


" }}}
"===================== FILE TYPE ======================
" {{{

" C
autocmd FileType c,cpp setlocal tabstop=8 softtabstop=8 shiftwidth=8
autocmd FileType c,cpp let easytags_always_enabled = 1


" vim
autocmd FileType vim setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab


" bats
autocmd FileType bats setlocal tabstop=2 softtabstop=2 shiftwidth=2


" HTML
autocmd FileType html,htmldjango,css,javascript,json,sass,scss,vue,typescript,handlebars
    \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType html,htmldjango,css,sass,scss,vue
    \ setlocal foldmethod=indent


" Vuejs
autocmd FileType vue syntax sync fromstart
autocmd FileType vue setlocal nocursorline " Disable cursorline to make vim-vue fast

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


" Ruby
autocmd BufRead,BufNewFile *.podspec set filetype=ruby
autocmd BufRead,BufNewFile Podfile set filetype=ruby
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" YAML
autocmd BufRead,BufNewFile *.yml set filetype=yaml
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" conf
autocmd BufRead,BufNewFile *.conf set filetype=conf
autocmd FileType conf setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab


" HCL
autocmd FileType terraform setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" Terraform
autocmd FileType terraform setlocal commentstring=#%s


" Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.report set filetype=markdown
autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" }}}
"===================== Custom vimscript ======================
" {{{

" http://blog.erw.dk/2016/04/19/entering-dates-and-times-in-vim/
noremap! <expr> ,t strftime("%H:%M:%S")
noremap! <expr> ,d strftime("%Y-%m-%d")
noremap! <expr> ,l strftime("%Y-%m-%d %H:%M")
noremap! ,, ,

" [Multiple Cursors](http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/)
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *``cgn
nnoremap cN *``cgN

vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"

function! SetupCR()
  nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

" }}}
"" vim:foldmethod=marker:foldlevel=0
