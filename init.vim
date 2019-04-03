" ========================================================= THIS MUST BE FIRST, BECAUSE IT CHANGES OTHER OPTIONS AS CONSEQUENCE
set t_Co=256

" ==================================================================================================================== VIM-PLUG
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/morhetz/gruvbox.git'                  " GRUVBOX          : colorscheme
Plug 'https://github.com/itchyny/lightline.vim.git'            " LIGHTLINE        : Statusline
Plug 'https://github.com/airblade/vim-gitgutter.git'           " GITGUTTER        : show symbols from git on the left
Plug 'scrooloose/nerdtree'                                     " NERDTREE         : file explorer
  Plug 'Xuyuanp/nerdtree-git-plugin'                           " GIT SYMBOLS
Plug 'https://github.com/majutsushi/tagbar.git'                " TAGBAR           : bar with tags
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'     " VIM-GUTENTAGS    : update tags automatically
Plug 'w0rp/ale'                                                " ALE              : asynchronous lint engine
Plug 'maximbaz/lightline-ale'                                  " LIGHTLINE-ALE    : lightline for ALE
Plug 'https://github.com/rhysd/vim-grammarous.git'             " GRAMMAROUS       : powerful grammar checker (LanguageTool)
Plug 'https://github.com/SirVer/ultisnips.git'                 " ULTISNIPS        : snippets engine
  Plug 'https://github.com/honza/vim-snippets.git'             " Snippets
"Plug 'https://github.com/stevearc/vim-arduino.git'             " VIM-ARDUINO      : arduino ide
"Plug 'artur-shaik/vim-javacomplete2'                           " JAVACOMPLETE2    : Java completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " DEOPLETE         : async completion
  Plug 'zchee/deoplete-clang'                                  " C/C++/C#
  Plug 'zchee/deoplete-jedi'                                   " PYTHON
  Plug 'fszymanski/deoplete-emoji'                             " EMOJI CODES
  Plug 'Shougo/neco-syntax'                                    " VARIOUS
Plug 'https://github.com/shinokada/dragvisuals.vim.git'        " DRAGVISUALS      : move selection
Plug 'https://github.com/godlygeek/tabular.git'                " TABULAR          : text filtering and alignment
Plug 'https://github.com/fidian/hexmode.git'                   " HEXMODE          : editing binary files
"Plug 'donRaphaco/neotex', { 'for': 'tex' }                     " NEOTEX           : latex live preview

Plug 'https://github.com/nelstrom/vim-visual-star-search.git'

" Initialize plugin system
call plug#end()

" ================================================================================================================== GRAMMAROUS
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

" ========================================================================================================================= ALE
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
let g:ale_linters = {
  \   'c': ['gcc', 'clang'],
  \   'cpp': ['make', 'gcc', 'clang'],
  \   'java': ['javac', 'checkstyle'],
  \   'verilog': ['iverilog'],
  \   'python': ['flake8'],
  \   'vhdl': ['vcom'],
  \}
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'c': ['clang-format'],
  \   'cpp': ['clang-format'],
  \}

let g:ale_c_parse_makefile=1
let g:ale_c_gcc_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow "
let g:ale_c_clang_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow "
let g:ale_c_clangformat_options= "--style=file"

let g:ale_python_flake8_options= "--ignore=E221"

"let g:ale_fix_on_save=1
"let g:ale_lint_on_save=1

" =============================================================================================================== LIGHTLINE-ALE
let g:lightline#ale#indicator_checking = "\uf110 ..."
let g:lightline#ale#indicator_warnings = "\uf071: "
let g:lightline#ale#indicator_errors   = "\uf05e: "
let g:lightline#ale#indicator_ok       = "\uf00c: "

" =================================================================================================================== ULTISNIPS
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = "<c-space>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==================================================================================================================== DEOPLETE
let g:deoplete#enable_at_startup            = 1
let g:deoplete#sources#clang#libclang_path  = '/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header   = '/usr/include/clang/6.0.0/include/'

" =================================================================================================================== GUTENTAGS
"let g:gutentags_cache_dir= '/tmp/'
"let g:gutentags_trace=1

" ============================================================================================== SET THE STATUSLINE [LIGHTLINE]
set laststatus=2
set noshowmode

" Possible colorschemes: jellybeans, gruvbox, powerline[default], wombat, solarized dark,
" solarized light, PaperColor light, seoul256, one, landscape
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ],
      \              [ 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok', ],
      \              [ 'gutentag' ] ],
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'readonly', 'absolutepath', 'spell', 'tagbar' ] ]
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
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
      \   'gutentag' : '%{gutentags#statusline("[","...]")}',
      \ },
      \ 'separator'    : { 'left' : '', 'right'      : '' },
      \ 'subseparator' : { 'left' : "\u25c9", 'right' : "\u25c9" }
      \ }

let g:lightline.inactive = {
	\ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ] ]
    \}

let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ],
	\ 'right': [ [  ] ] }

" ARDUINO - [arduino:avr:uno] [arduino:usbtinyisp] (/dev/ttyACM0:9600)
function! LightlineArduino()
  let port = arduino#GetPort()
  let line = '[' . g:arduino_board . '] [' . g:arduino_programmer . ']'
  if !empty(port)
    let line = line . ' (' . port . ':' . g:arduino_serial_baud . ')'
  endif
  return line
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

let g:lightline.mode_map = {
    \ 'n' : "\u2115",
    \ 'i' : "\U1d540",
    \ 'R' : "\u211d",
    \ 'v' : "\U1d54d",
    \ 'V' : "\U1d54d-\U1d543",
    \ "\<C-v>": "\U1d54d-\U1d539",
    \ 'c' : "\u2102",
    \ 's' : "\U1d54a",
    \ 'S' : "\U1d54a-\U1d543",
    \ "\<C-s>": "\U1d54a-\U1d539",
    \ 't': "\U1d54b",
    \ }

" ================================================================================================================= DRAG VISUALS
runtime plugin/dragvisuals.vim

vmap  <expr>  H        DVB_Drag('left')
vmap  <expr>  L        DVB_Drag('right')
vmap  <expr>  J        DVB_Drag('down')
vmap  <expr>  K        DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

"Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" ===================================================================================================================== TAG BAR
nnoremap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_sort = 0 " sort according to the order in source file

" ==================================================================================================================== NERDTREE
map <silent> <F2> :NERDTreeToggle<CR>

" ===================================================================================================================== HEXMODE
nnoremap <Leader>h :Hexmode<CR>
inoremap <Leader>h <Esc>:Hexmode<CR>
vnoremap <Leader>h :<C-U>Hexmode<CR>
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'

" ================================================================================================================= COLORSCHEME
set termguicolors     " enable true colors support
set background=dark
colo gruvbox

" =============================================================================================================== SET SKELETONS
autocmd BufNewFile  *.m	          0r ~/.config/nvim/skeleton/skeleton.m
autocmd BufNewFile  *.tex         0r ~/.config/nvim/skeleton/skeleton.tex
autocmd BufNewFile  *.vhd         0r ~/.config/nvim/skeleton/skeleton.vhd
autocmd BufNewFile  *.v           0r ~/.config/nvim/skeleton/skeleton.v
autocmd BufNewFile  *.cpp	      0r ~/.config/nvim/skeleton/skeleton.cpp
"autocmd BufNewFile  *.c	          0r ~/.config/nvim/skeleton/skeleton.c
autocmd BufNewFile  *.c	          0r ~/.config/nvim/skeleton/skeleton_doxy.c
autocmd BufNewFile  *.h	          0r ~/.config/nvim/skeleton/skeleton_doxy.h
"autocmd BufNewFile  *.h	          0r ~/.config/nvim/skeleton/skeleton.h
autocmd BufNewFile  *.adoc        0r ~/.config/nvim/skeleton/skeleton.adoc
autocmd BufNewFile  *.py          0r ~/.config/nvim/skeleton/skeleton.py

autocmd BufNewFile  *.pro         0r ~/.config/nvim/skeleton/skeleton.pro
autocmd BufNewFile  .gitignore    0r ~/.config/nvim/skeleton/skeleton.gitignore
autocmd BufNewFile  .clang-format 0r ~/.config/nvim/skeleton/skeleton.clang-format
autocmd BufNewFile  Makefile      0r ~/.config/nvim/skeleton/Makefile

" ============================================================================================================= UPDATE SKELETON
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

" ======================================================================================================== ORDER THE NEW SPLITS
set splitbelow
set splitright

" ============================================================================================================== ENABLE FOLDING
set foldmethod =indent
set foldlevel  =99

" =========================================================================================== ENABLE FOLDING WITH THE SPACE BAR
nnoremap <space> za

" ========================================================================================================== NO WRAPPING AROUND
set nowrap

" ======================================================================================================== USE ALWAYS CLIPBOARD
set clipboard+=unnamedplus   " To ALWAYS use the clipboard for ALL operations

" ======================================================================================== MAKE BACKSPACE WORK IN A SANE MANNER
set backspace=indent,eol,start

" ============================================================================================================= SET INDENTATION
set autoindent      " align the new line indent with the previous line
set textwidth  =120 " max character in a line before auto breaking
set tabstop    =4   " number of spaces inserted per tab
set shiftwidth =4   " number of spaces to indent after a line is broken
set expandtab       " insert spaces when tab is pressed

set softtabstop=4   " insert/delete 4 spaces when hitting a TAB/BACKSPACE

" ======================================================================================== ALWAYS SHOW TAB LINE AND CURRENT CMD
set showtabline=2   " always show tab page labels
set showcmd

" ============================================================== ENABLE FILE TYPE DETECTION AND DO LANGUAGE-DEPENDENT INDENTING
filetype plugin indent on

" =============================================================================================== SWITCH SYNTAX HIGHLIGHTING ON
syntax on

" ================================================================================================= MAKE LATEX THE STANDARD TEX
let g:tex_flavor='latex'

" =========================================================================================================== SHOW LINE NUMBERS
set number
" set hybrid line numbers
" set number relativenumber
"
" " set auto toggle of numbering mode
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" ================================================================ ALLOW HIDDEN BUFFERS, DON'T LIMIT TO 1 FILE PER WINDOW/SPLIT
set hidden

" ====================================================================================================== CONFIGURING HIGHLIGHTS
set hlsearch "highlight searches
set ignorecase "ignore case in search and replace
set smartcase "don't ignore case if Upper Case letters appear in search

" Set the highlight for line number
set cul
" hi clear CursorLine
" augroup CLClear
"         autocmd! ColorScheme * hi clear CursorLine
"     augroup END
" hi CursorLineNR cterm=bold
" augroup CLNRSet
"         autocmd! ColorScheme * hi CursorLineNR cterm=bold
"     augroup END

" Reconfigure highlights for spells
"hi clear SpellBad       " Word not recognised
"hi clear SpellCap       " Word not capitalised
"hi clear SpellRare      " Rare word
"hi clear SpellLocal     " Wrong spelling for selected region
"
"hi SpellBad    ctermfg=007      ctermbg=124    cterm=bold        guifg=NONE   guibg=NONE   gui=NONE
"hi SpellCap    ctermfg=NONE     ctermbg=NONE   cterm=underline   guifg=NONE   guibg=NONE   gui=NONE
"hi SpellRare   ctermfg=NONE     ctermbg=NONE   cterm=bold        guifg=NONE   guibg=NONE   gui=NONE
"hi SpellLocal  ctermfg=NONE     ctermbg=NONE   cterm=italic      guifg=NONE   guibg=NONE   gui=NONE

" ==================================================================================================================== MAPPINGS
imap <silent> <C-S>			<C-O>:update<CR>
map <silent> <C-S>			<Esc>:update<CR>
cmap <silent> <C-S>			:update<CR>

" Terminal
function ST()
  execute "split"
  execute "terminal"
  execute "res 10"
endfunction

function VT()
  execute "vsplit"
  execute "terminal"
"  execute "vertical res 50"
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
command! TSC call TSC()

" Escape
map  ßß <Esc>
map! ßß <Esc>

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

" ==================================================================================================================== MAPPINGS
set wildignore+=*.a,*.o,*.elf
set wildignore+=*.bmp,*.gif,*.ico,*jpg,*jpeg,*.png
set wildignore+=*.git
set wildignore+=*~,*.swp,*.tmp

" =============================================================================================================== LOCAL SCRIPTS
set exrc
set secure
