"===================== SETTINGS ======================
" {{{

syntax on
syntax sync minlines=256
set autochdir
set autoindent
set backspace=indent,eol,start
set enc=utf-8
set expandtab
set fenc=utf-8
set formatoptions-=t
set formatoptions-=a
set formatoptions-=o
set hlsearch
set incsearch
set laststatus=2
set list
set listchars=trail:_,eol:¬,tab:▸\ 
set nofoldenable
set number
set relativenumber
set shell=fish
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set spell
set spelllang=en,cjk
set splitright
set tabstop=4
set title
set textwidth=80
set virtualedit+=block
set wildmenu wildmode=list:full
set wrapscan
"set nowrap
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" }}} 
" ===================== MAPPINGS ======================
" {{{

" General
" noremap ; :
" noremap : ;
noremap Q gq
noremap <Space>h  ^
noremap <Space>l  $
noremap <Space>n  %
inoremap <C-a> <Esc>0i
inoremap <C-e> <Esc>$a
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
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Always insert newline at EOF
augroup ensure_blankline_at_eof
  autocmd!
  autocmd BufWritePre * if expand('%:t') !~# '\.lock$' && getline('$') != '' | call append(line('$'), '') | endif
augroup END

" }}}
"===================== PLUGINS ======================
" {{{
packadd! editorconfig
packadd! matchit
packadd comment
packadd nohlsearch

call plug#begin('~/.vim/plugged')

set modeline
set cursorline
" Basic
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Yggdroot/indentLine'
Plug 'corylanou/vim-present', {'for' : 'present'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/grep.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Completion

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'mattn/vim-lsp-settings'

" Lint

Plug 'dense-analysis/ale'

" Test
"
Plug 'vim-test/vim-test'

" Color

Plug 'w0ng/vim-hybrid'

" Tags

Plug 'preservim/tagbar'

" Status/Tabline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'

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


" HTML/JS plugins
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
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" HashiVim
Plug 'hashivim/vim-terraform'

" Go
"Plug 'fatih/vim-go'

" Swift
Plug 'keith/swift.vim'

" PlantUML
Plug 'aklt/plantuml-syntax'

" bats
Plug 'vim-scripts/bats.vim'

" protobuf
Plug 'uber/prototool', { 'rtp':'vim/prototool' }

" graphql
Plug 'jparise/vim-graphql'

" kotlin
Plug 'udalov/kotlin-vim'

" ruby
Plug 'vim-ruby/vim-ruby'

" TOML
Plug 'cespare/vim-toml', { 'branch': 'main' }

" zig
Plug 'ziglang/zig.vim'

" rust
Plug 'rust-lang/rust.vim'

call plug#end()
" }}}
"===================== COLOR ======================
" {{{

set background=dark
set t_Co=256
let g:rehash256 = 1
if (has("termguicolors"))
 set termguicolors
endif

colorscheme hybrid
highlight LineNr ctermfg=250 guifg=#bcbcbc
highlight CursorLineNr ctermfg=220 guifg=#ffd700
highlight CursorLine ctermbg=236 guibg=#303030

let &colorcolumn=join(range(81,1000),",")
highlight ColorColumn ctermbg=235

" vim-gitgutter color settings
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn


" }}}
"===================== REGISTRATIONS ======================
" {{{

" https://github.com/prabirshrestha/vim-lsp/wiki/Servers

if executable('bash-language-server')
  augroup LspBash
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  augroup END
endif

"" Register clangd C++ lanuage server.
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif

" RLS is no longer supported. https://blog.rust-lang.org/2022/07/01/RLS-deprecation.html
" Need to install 'rust-analyzer'. https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif

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
let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\   'go': ['golint'],
\   'proto': ['prototool-lint'],
\   'rust': ['analyzer'],
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_cpp_cc_options = '-std=c++20 -Wall'
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" commentary.vim

autocmd FileType c,cpp,go,swift setlocal commentstring=//\ %s
"

" CurtineIncSw.vim
autocmd FileType c,cpp nnoremap <S-J> :call CurtineIncSw()<CR>

" git
augroup filetypedetect
  autocmd!
  autocmd BufRead,BufNewFile */git/config* set filetype=gitconfig
augroup END
augroup GitCommitFormat
  autocmd!
  autocmd FileType gitcommit setlocal formatoptions+=t formatoptions-=a textwidth=72
augroup END

" fern
nnoremap <silent> <Leader>1 :Fern . -drawer -toggle<CR>
function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> o <Plug>(fern-action-open:system)
endfunction
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
autocmd FileType fern-replacer let g:airline_disable_statusline = 1

" fzf
nnoremap <leader>: :Commands<CR>

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
\ <bang>0)

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, {'source': 'rg --files --no-ignore-vcs'}, <bang>0)

" HashiVim
let g:terraform_align=1

" lsp
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/.cache/vim-lsp/vim-lsp.log')

" Minimap
let g:minimap_highlight='Visual'
let g:minimap_toggle='<leader>mt'


" NERDTree
" nnoremap <silent> <Leader>1 :NERDTreeToggle<CR>
" let g:NERDTreeQuitOnOpen = 1  " Not working...
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeSortHiddenFirst = 1
let g:NERDTreeSortOrder = ['README\.md$', '\.git.*$', '\/$', '*']


" plantuml-syntax
let g:plantuml_executable_script = "~/.plantuml/plantuml""

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
nnoremap <silent> <Leader>0 :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_ctags_bin = '/opt/local/bin/uctags'

" vim-airline
let g:airline_theme = "luna"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" vim-lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" indentLine
let g:indentLine_color_term = 251
let g:indentLine_setConceal = 0


" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 2
autocmd FileType markdown call s:SetMarkDown()
function! s:SetMarkDown()
nnoremap <silent> <Leader>0 :Toc<CR>
endfunction


" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_ignore_groups = ['String']


" vim-easytag
let g:easytags_file = '~/.vim/tags'
let g:easytags_async = 1
let g:easytags_always_enabled = 0
let g:easytags_include_members = 1


" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" vim-test
let test#strategy = "vimterminal"


" }}}
"===================== FILE TYPE ======================
" {{{

" c
autocmd FileType c,cpp setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
function! s:clang_format()
  let now_line = line(".")
  exec ":%! clang-format -style=WebKit"
  exec ":" . now_line
endfunction

if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch] call s:clang_format()
  augroup END
endif

" bats
autocmd FileType bats setlocal tabstop=2 softtabstop=2 shiftwidth=2

" html
autocmd FileType html,htmldjango,css,javascript,json,sass,scss,vue,typescript,handlebars
    \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType html,htmldjango,css,sass,scss,vue
    \ setlocal foldmethod=indent

" vue
autocmd FileType vue syntax sync fromstart
autocmd FileType vue setlocal nocursorline " Disable cursorline to make vim-vue fast

" shell
autocmd FileType sh setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" erlang
autocmd BufRead,BufNewFile *.erl setlocal filetype=erlang
autocmd FileType erlang setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" ruby
autocmd BufRead,BufNewFile *.podspec set filetype=ruby
autocmd BufRead,BufNewFile Podfile set filetype=ruby
autocmd BufRead,BufNewFile *Fastfile set filetype=ruby
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" yaml
autocmd BufRead,BufNewFile *.yml set filetype=yaml
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" HCL
autocmd FileType terraform setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" terraform
autocmd FileType terraform setlocal commentstring=#%s

" protobuf
autocmd FileType proto setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" go
autocmd FileType go setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" swift
autocmd FileType swift setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" dart
autocmd FileType dart setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" markdown
autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" vim
autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" }}}
"===================== Custom vimscript ======================
" {{{

" rust
let g:rustfmt_autosave = 1

" Based http://blog.erw.dk/2016/04/19/entering-dates-and-times-in-vim/
nnoremap <leader>t a<C-R>=strftime("%H:%M")<CR><Esc>
nnoremap <leader>d a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
nnoremap <leader>l a<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>


" Fro vim-test
nmap <silent> <leader>u :TestNearest<CR>
nmap <silent> <leader>U :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Automatically removing all trailing whitespace
autocmd FileType c,cpp,js,ts,go,swift autocmd BufWritePre <buffer> %s/\s\+$//e

" [Multiple Cursors](http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/)
let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"


" From http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/#changing-a-visual-selection
" Replace a selection: selector<C-v>, type cn, do your change, then n to go next occurence, and . to replay the change
nnoremap cn *``cgn
nnoremap cN *``cgN

vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"

vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

" Key bindings for vim-lsp.
nn <silent> <c-j> :LspDefinition<cr>
nn <silent> <M-r> :LRspReferences<cr>
nn <silent> <c-h> :LspHover<cr>
nn <silent> <Leader>R :LspRename<cr>
nn <silent> <M-a> :LspWorkspaceSymbol<cr>
nn <silent> <M-l> :LspDocumentSymbol<cr>

" }}}

