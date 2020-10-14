" ====================== THIS MUST BE FIRST, BECAUSE IT CHANGES OTHER OPTIONS AS CONSEQUENCE
set t_Co=256

" ================================================================================= VIM-PLUG
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
" ================== EXPERIMENTAL ====================
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'https://github.com/puremourning/vimspector'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/skywind3000/vim-cppman'
" ================== EXPERIMENTAL ====================

Plug 'mhinz/vim-startify'                                      " STARTIFY         : fancy start screen

Plug 'neoclide/coc.nvim', {'branch': 'release'}                " COC              : Language client
Plug 'w0rp/ale'                                                " ALE              : asynchronous lint engine
  Plug 'maximbaz/lightline-ale'                                  " LIGHTLINE-ALE    : lightline for ALE

Plug 'https://github.com/kergoth/vim-bitbake.git'              " BITBAKE          : syntax check for the bitbake tool
Plug 'nfnty/vim-nftables'                                      " NFTABLES         : nft syntax highlighting

Plug 'iamcco/markdown-preview.nvim',
            \ { 'do': { -> mkdp#util#install() } }              " MARKDOWN-PREVIEW : live previewing markdown
"Plug 'https://github.com/rhysd/vim-grammarous.git'             " GRAMMAROUS       : powerful grammar checker (LanguageTool)
"Plug 'donRaphaco/neotex', { 'for': 'tex' }                     " NEOTEX           : latex live preview

Plug 'https://github.com/fidian/hexmode.git'                   " HEXMODE          : editing binary files
Plug 'https://github.com/shinokada/dragvisuals.vim.git'        " DRAGVISUALS      : move selection
Plug 'https://github.com/nelstrom/vim-visual-star-search.git'  " VISUAL-STAR      : search words in visual

Plug 'scrooloose/nerdtree'                                     " NERDTREE         : file explorer
  Plug 'Xuyuanp/nerdtree-git-plugin'                             " GIT SYMBOLS
Plug 'jsfaint/gen_tags.vim'                                    " GEN-TAGS         : update tags automatically
Plug 'https://github.com/majutsushi/tagbar.git'                " TAGBAR           : bar with tags & code symbols
Plug 'https://github.com/morhetz/gruvbox.git'                  " GRUVBOX          : colorscheme
Plug 'https://github.com/itchyny/lightline.vim.git'            " LIGHTLINE        : Statusline

" Initialize plugin system
call plug#end()

" ============================================================================= EXPERIMENTAL
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }
nnoremap <silent> <C-F> :Files<CR>
let g:fzf_preview_window = 'up:60%'

au BufEnter *.c :set keywordprg=:Man
au BufEnter *.cpp :set keywordprg=:Cppman
au BufEnter *.hpp :set keywordprg=:Cppman
nmap <leader>dl :call vimspector#Launch()<CR>
nmap <leader>dr :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput


nmap <F6> <Plug>VimspectorContinue
nmap <F7> <Plug>VimspectorStop
nmap <F8> <Plug>VimspectorRestart
nmap <F9> <Plug>VimspectorPause
nmap <F10> <Plug>VimspectorToggleBreakpoint
"nmap <F5> <Plug>VimspectorToggleConditionalBreakpoint
"nmap <F5> <Plug>VimspectorAddFunctionBreakpoint
nmap <F11> <Plug>VimspectorStepOver
nmap <F12> <Plug>VimspectorStepInto
"nmap <F5> <Plug>VimspectorStepOut

" ================================================================================= STARTIFY
" Automatically update sessions
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
" Sort sessions by modification time
let g:startify_session_sort = 1
let g:startify_session_before_save = [
    \ 'echo "Cleaning up before saving.."',
    \ 'silent! NERDTreeTabsClose'
    \ ]

let g:startify_bookmarks = [
        \ { 'init': '~/.config/nvim/init.vim' },
        \ { 'proj': '~/Projects' },
        \ ]

let g:startify_files_number = 5

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

" ====================================================================================== COC
" gr - show a list of references made
nmap <silent> gr <Plug>(coc-references)
" gd - toggles between definition and declaration
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" gh - get hint on whatever's under the cursor
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)

let g:coc_global_extensions=[
            \ 'coc-git',
            \ 'coc-python',
            \ 'coc-texlab',
            \ 'coc-json',
            \ 'coc-xml',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-spell-checker',
            \ 'coc-marketplace',
            \ ]

" 'coc-explorer',
" For diagnostic messages
set updatetime=300

" =============================================================================== GRAMMAROUS
let g:grammarous#show_first_error=0   " see the first error in a info window soon after the check
let g:grammarous#default_comments_only_filetypes={ '*' : 1, 'tex' : 0, 'markdown' : 0, 'text' : 0, } " check comments only

" Move the cursor to the info window
command GrammarousMove     execute "normal \<Plug>(grammarous-move-to-info-window)"
" Open the info window for the error under the cursor
command GrammarousOpen     execute "normal \<Plug>(grammarous-open-info-window)"
" Fix the error under the cursor automatically
command GrammarousFix      execute "normal \<Plug>(grammarous-fixit)"
" Fix all the errors in a current buffer automatically
command GrammarousFixAll   execute "normal \<Plug>(grammarous-fixall)"
" Close the information window from checked buffer
command GrammarousClose    execute "normal \<Plug>(grammarous-close-info-window)"
" Remove the error under the cursor
command GrammarousRemove   execute "normal \<Plug>(grammarous-remove-error)"
" Disable the grammar rule under the cursor
command GrammarousDisable  execute "normal \<Plug>(grammarous-disable-rule)"
" Move cursor to the next error
command GrammarousNext     execute "normal \<Plug>(grammarous-move-to-next-error)"
" Move cursor to the previous error
command GrammarousPrevious execute "normal \<Plug>(grammarous-move-to-previous-error)"

" ================================================================================ GITGUTTER
let g:gitgutter_max_signs=800
" highlight the line numbers for changed lines
let g:gitgutter_highlight_linenrs = 1

" ====================================================================================== ALE
highlight link ALEVirtualTextError ErrorMsg
highlight link ALEVirtualTextInfo SpellLocal
highlight link ALEVirtualTextStyleError TermCursor
highlight link ALEVirtualTextStyleWarning SpellCap
highlight link ALEVirtualTextWarning GruvboxYellow

let g:ale_sign_error         = "\uf05e"
let g:ale_sign_warning       = "\uf071"
let g:ale_sign_style_error   = "\u2b4d"
let g:ale_sign_style_warning = "\ufe15"
let g:ale_sign_info          = "\u2139"

let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = " \u2b9e "

let g:ale_echo_msg_format = '[%linter%] %code: %%s'

let g:ale_linters_explicit = 1
" Linters that should be enabled just before commits, because of their overhead:
"   - c/c++ : 'cppcheck',
"   - sh    : 'shellcheck',
let g:ale_linters = {
  \   'c'         : ['gcc', 'clangtidy', 'flawfinder'],
  \   'cpp'       : ['gcc', 'clangtidy', 'flawfinder', 'cppcheck'],
  \   'python'    : ['flake8', 'bandit', 'pylint'],
  \   'verilog'   : ['iverilog'],
  \   'java'      : ['checkstyle'],
  \   'rust'      : ['cargo', 'rls', 'rustc'],
  \   'vhdl'      : ['vcom'],
  \   'lua'       : ['luac', 'luacheck'],
  \   'dockerfile': ['hadolint'],
  \   'cmake'     : ['cmakelint'],
  \   'matlab'    : ['mlint'],
  \}

let g:ale_fixers = {
  \   '*'     : ['remove_trailing_lines', 'trim_whitespace'],
  \   'cmake' : ['remove_trailing_lines', 'trim_whitespace', 'cmakeformat'],
  \   'c'     : ['remove_trailing_lines', 'trim_whitespace', 'clang-format'],
  \   'cpp'   : ['remove_trailing_lines', 'trim_whitespace', 'clang-format'],
  \   'python': ['remove_trailing_lines', 'trim_whitespace'],
  \   'java'  : ['remove_trailing_lines', 'trim_whitespace', 'google_java_format'],
  \   'json'  : ['fixjson'],
  \   'html'  : ['prettier'],
  \}

" Java
" Doing a trick to make it work as I'm using a *.jar here
let g:ale_java_google_java_format_executable="java"
let g:ale_java_google_java_format_options="-jar /opt/google-java-format.jar"

" C Options
let g:ale_c_gcc_options= " -Wall -Werror -pipe -Wpedantic -Wextra -Wwrite-strings -Wformat-nonliteral -Wformat-security -Wbad-function-cast -Wcast-qual -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wshadow -fsanitize=undefined -fsanitize=address -Wmissing-format-attribute -Winline -Wmissing-format-attribute "
let g:ale_c_clangtidy_options=""
let g:ale_c_clangtidy_extra_options="-checks=*"
let g:ale_c_cppcheck_options="--enable=all -v --std=c99 --force"

" Cpp Options
let g:ale_cpp_gcc_options= " -std=c++17 -Wall -Werror -pipe -Wpedantic -Wextra -Wwrite-strings -Wformat-nonliteral -Wformat-security -Wbad-function-cast -Wcast-qual -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wshadow -fsanitize=undefined -fsanitize=address -Wmissing-format-attribute -Winline -Wmissing-format-attribute "
let g:ale_cpp_clangtidy_extra_options="" " Use .clang-tidy files
"-checks=*,-fuchsia-default-arguments,-readability-static-accessed-through-instance,-llvm-include-order,-llvm-header-guard"
let g:ale_cpp_cppcheck_options="--enable=all --std=c++17 --force"

" C & Cpp
let g:ale_c_parse_makefile=1
let g:ale_c_parse_compile_commands=1
let g:ale_c_clangformat_options= "--style=file --fallback-style=google"

" Python3
" ignore:
"   - E221: multiple spaces before operator
"   - E501: line too long
"   - N802: function name should be lowercase
let g:ale_python_flake8_options="--ignore=E221,E501,N802"

"let g:ale_fix_on_save=1
"let g:ale_lint_on_save=1

" ============================================================================ LIGHTLINE-ALE
let g:lightline#ale#indicator_checking = "\uf110 ..."
let g:lightline#ale#indicator_warnings = "\uf071: "
let g:lightline#ale#indicator_errors   = "\uf05e: "
let g:lightline#ale#indicator_ok       = "\uf00c"

" ========================================================================= MARKDOWN-PREVIEW
let g:mkdp_auto_close = 0
let g:mkdp_command_for_global = 1
let g:mkdp_preview_options = {
    \ 'sync_scroll_type': 'relative',
    \ 'uml': '-tsvg',
    \ }

" ================================================================================= GEN-TAGS
let g:gen_tags#gtags_auto_gen=1
let g:gen_tags#gtags_auto_update=0
let g:gen_tags#ctags_opts='-c -a -d --verbose'

let g:gen_tags#ctags_auto_gen=1
let g:gen_tags#ctags_auto_update=0

let g:gen_tags#statusline=1
"" Disable preview on Scratch of Omnifunction
"set completeopt-=preview

" =========================================================== SET THE STATUSLINE [LIGHTLINE]
set laststatus=2
set noshowmode

" Possible colorschemes: jellybeans, gruvbox, powerline[default], wombat, solarized dark,
" solarized light, PaperColor light, seoul256, one, landscape
let g:lightline = {
      \ 'active': {
      \   'right': [ [ 'buffernr' ],
      \              [ 'lineinfo', 'percent' ],
      \              [ 'fileencoding', 'filetype' ],
      \              [ 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'cocstatus', 'blame' ] ],
      \   'left':  [ [ 'mode', 'paste', 'coc' ],
      \              [ 'readonly', 'spell', 'tagbar' ] ]
      \ },
      \ 'inactive': {
	  \   'left':  [ [ 'filename' ],
      \              [ 'tagbar'   ] ],
	  \   'right': [ [ 'buffernr'  ],
	  \              [ 'lineinfo', 'percent' ]]
      \ },
      \ 'colorscheme': 'one',
      \ 'separator'    : { 'left' : '', 'right'      : '' },
      \ 'subseparator' : { 'left' : "\u25c9", 'right' : "\u25c9" },
      \ 'mode_map' : {
      \   'n'      : "\u2115",
      \   'i'      : "\U1d540",
      \   'R'      : "\u211d",
      \   'v'      : "\U1d54d",
      \   'V'      : "\U1d54d-\U1d543",
      \   "\<C-v>" : "\U1d54d-\U1d539",
      \   'c'      : "\u2102",
      \   's'      : "\U1d54a",
      \   'S'      : "\U1d54a-\U1d543",
      \   "\<C-s>" : "\U1d54a-\U1d539",
      \   't'      : "\U1d54b",
      \   },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'cocstatus': 'coc#status',
      \   'blame': 'LightlineGitBlame',
      \ },
      \ 'component_expand': {
      \   'linter_checking' : 'lightline#ale#checking',
      \   'linter_warnings' : 'lightline#ale#warnings',
      \   'linter_errors'   : 'lightline#ale#errors',
      \   'linter_ok'       : 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking' : 'left',
      \   'linter_warnings' : 'warning',
      \   'linter_errors'   : 'error',
      \   'linter_ok'       : 'left',
      \ },
      \ 'component': {
      \   'tagbar'   : '%{tagbar#currenttag("[%s]", "", "f")}',
      \   'buffernr' : '%{bufnr("%")}',
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [  ] ]
      \ },
      \ }

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" ============================================================================= DRAG VISUALS
runtime plugin/dragvisuals.vim

vmap  <expr>  H        DVB_Drag('left')
vmap  <expr>  L        DVB_Drag('right')
vmap  <expr>  J        DVB_Drag('down')
vmap  <expr>  K        DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

"Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" ================================================================================== TAG BAR
nnoremap <silent> <F3> :TagbarOpenAutoClose<CR>
let g:tagbar_sort = 0 " sort according to the order in source file
let g:tagbar_compact = 1

" ================================================================================= NERDTREE
map <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer=1

" ================================================================================== HEXMODE
nnoremap <Leader>h :Hexmode<CR>
inoremap <Leader>h <Esc>:Hexmode<CR>
vnoremap <Leader>h :<C-U>Hexmode<CR>
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'

" ============================================================================== COLORSCHEME
set termguicolors     " enable true colors support
set background=dark
"set background=light
colo gruvbox

" ============================================================================ SET SKELETONS
autocmd BufNewFile  *.m	           0r ~/.config/nvim/skeleton/skeleton.m
autocmd BufNewFile  *.tex          0r ~/.config/nvim/skeleton/skeleton.tex
autocmd BufNewFile  *.vhd          0r ~/.config/nvim/skeleton/skeleton.vhd
autocmd BufNewFile  *.v            0r ~/.config/nvim/skeleton/skeleton.v
autocmd BufNewFile  *.asm          0r ~/.config/nvim/skeleton/skeleton.asm
autocmd BufNewFile  *.s            0r ~/.config/nvim/skeleton/skeleton.asm
autocmd BufNewFile  *.java	       0r ~/.config/nvim/skeleton/skeleton_doc.java
autocmd BufNewFile  *.html	       0r ~/.config/nvim/skeleton/skeleton.html
"autocmd BufNewFile  *.cpp	       0r ~/.config/nvim/skeleton/skeleton.cpp
autocmd BufNewFile  *.cpp	       0r ~/.config/nvim/skeleton/skeleton_doxy.cpp
"autocmd BufNewFile  *.c	           0r ~/.config/nvim/skeleton/skeleton.c
autocmd BufNewFile  *.c	           0r ~/.config/nvim/skeleton/skeleton_doxy.c
autocmd BufNewFile  *.h	           0r ~/.config/nvim/skeleton/skeleton_doxy.h
"autocmd BufNewFile  *.h	           0r ~/.config/nvim/skeleton/skeleton.h
autocmd BufNewFile  *.adoc         0r ~/.config/nvim/skeleton/skeleton.adoc
autocmd BufNewFile  *.py           0r ~/.config/nvim/skeleton/skeleton.py
autocmd BufNewFile  *.sh           0r ~/.config/nvim/skeleton/skeleton.sh

autocmd BufNewFile  *.pro          0r ~/.config/nvim/skeleton/skeleton.pro
autocmd BufNewFile  .gitignore     0r ~/.config/nvim/skeleton/skeleton.gitignore
autocmd BufNewFile  .clang-format  0r ~/.config/nvim/skeleton/skeleton.clang-format
autocmd BufNewFile  .ccls          0r ~/.config/nvim/skeleton/skeleton.ccls
autocmd BufNewFile  .nvimrc        0r ~/.config/nvim/skeleton/skeleton.nvimrc
autocmd BufNewFile  CMakeLists.txt 0r ~/.config/nvim/skeleton/CMakeLists.txt
autocmd BufNewFile  Makefile       0r ~/.config/nvim/skeleton/Makefile

" ========================================================================== UPDATE SKELETON
autocmd BufWritePre ks|call UpSkel()|'s         " Updating skeleton
fun UpSkel()
  if line("$") > 20
    let l = 20
  else
    let l = line("$")
  endif
  exe "1," . l . "g/Last update: /s/Last update: .*/Last update: " .
  \ strftime("%Y %b %d")
  exe "1," . l . "g/File       : /s/File       : .*/File       : " .
  \ expand('%:t')
  exe "1," . l . "g/:Date: /s/:Date: .*/:Date: " .
  \ strftime("%Y %b %d")
  exe "1," . l . "g/@file     /s/@file     .*/@file     " .
  \ expand('%:t')
  exe "1," . l . "g/@date     /s/@date     .*/@date     " .
  \ strftime("%Y %b %d")
endfun

map <silent> <F5> :call UpSkel()<CR>

" ================================================================================== GENERAL
" no wrapping around
"set nowrap

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" ===================================================================== ORDER THE NEW SPLITS
set splitbelow
set splitright

" =========================================================================== ENABLE FOLDING
set foldmethod =indent
set foldlevel  =99

" ======================================================== ENABLE FOLDING WITH THE SPACE BAR
nnoremap <space> za

" ===================================================================== USE ALWAYS CLIPBOARD
set clipboard+=unnamedplus   " To ALWAYS use the clipboard for ALL operations

" ===================================================== MAKE BACKSPACE WORK IN A SANE MANNER
set backspace=indent,eol,start

" ========================================================================== SET INDENTATION
set autoindent      " align the new line indent with the previous line
set textwidth  =70  " max character in a line before auto breaking
set tabstop    =4   " number of spaces inserted per tab
set shiftwidth =4   " number of spaces to indent after a line is broken
set expandtab       " insert spaces when tab is pressed

set softtabstop=4   " insert/delete 4 spaces when hitting a TAB/BACKSPACE

" ===================================================== ALWAYS SHOW TAB LINE AND CURRENT CMD
set showtabline=2   " always show tab page labels
set showcmd

" =========================== ENABLE FILE TYPE DETECTION AND DO LANGUAGE-DEPENDENT INDENTING
filetype plugin indent on

" ============================================================ SWITCH SYNTAX HIGHLIGHTING ON
syntax on

" ============================================================== MAKE LATEX THE STANDARD TEX
let g:tex_flavor='latex'

" ======================================================================== SHOW LINE NUMBERS
set number

" =================================================================== CONFIGURING HIGHLIGHTS
set hlsearch "highlight searches
set ignorecase "ignore case in search and replace
set smartcase "don't ignore case if Upper Case letters appear in search

" Set the highlight for line number
set cul

" =========================================================================== CPP HIGHLIGHTS
"let g:cpp_class_scope_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_member_variable_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1

" ================================================================================= MAPPINGS
imap <silent> <C-S>			<C-O>:update<CR>
map <silent> <C-S>			<Esc>:update<CR>
cmap <silent> <C-S>			:update<CR>

" zoom in
noremap zi :resize 900<CR>:vertical resize 900<CR>
" zoom out
noremap zo <C-w>=

" Terminal
function ST()
  execute "split"
  execute "terminal"
  execute "norm! \<C-w>J<CR>"
  execute "res 10"
  execute "set wfh"
  execute "set wfw"
endfunction

function VT()
  execute "vsplit"
  execute "terminal"
"  execute "vertical res 50"
  execute "set wfh"
  execute "set wfw"
endfunction

function TT()
  execute "tabe"
  execute "terminal"
endfunction

function TSC()
  execute "terminal"
  execute "vsplit"
  execute "terminal"
  execute "split"
  execute "terminal"
endfunction

command! ST call ST()
command! VT call VT()
command! TT call TT()
command! TSC call TSC()

" Escape
map  -- <Esc>
map! -- <Esc>

" switching tabs
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
noremap <A-0> 10gt

" browsing splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Terminal browsing
tnoremap <c-h> <C-\><C-N><C-w>h
tnoremap <c-j> <C-\><C-N><C-w>j
tnoremap <c-k> <C-\><C-N><C-w>k
tnoremap <c-l> <C-\><C-N><C-w>l
inoremap <c-h> <C-\><C-N><C-w>h
inoremap <c-j> <C-\><C-N><C-w>j
inoremap <c-k> <C-\><C-N><C-w>k
inoremap <c-l> <C-\><C-N><C-w>l
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l

" Open tag in a new vertical split
map gT :sp <CR>:exec("tag ".expand("<cword>"))<CR>
" Open tag in a new horizontal split
map gt :vs <CR>:exec("tag ".expand("<cword>"))<CR>
" Open tag in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Don't jump rightway when using * and #
nnoremap * *N
nnoremap # #N

" ================================================== FILE PATTERNS TO IGNORE WHILE EXPANDING
set wildignore+=*.a,*.o,*.elf,*.out,*.bin
set wildignore+=*.bmp,*.gif,*.ico,*jpg,*jpeg,*.png
set wildignore+=*.pdf
set wildignore+=*.git
set wildignore+=*~,*.swp,*.tmp
set wildignore+=*.directory

" ============================================================================ LOCAL SCRIPTS
" source local init.vim files
set exrc
" restrict usage of some commands inside local init.vim files
set secure
