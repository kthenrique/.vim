" ========================================================= THIS MUST BE FIRST, BECAUSE IT CHANGES OTHER OPTIONS AS CONSEQUENCE 
set t_Co=256

let g:arduino_cmd = '/home/henrique/arduino-1.8.8/arduino'
let g:arduino_dir='/home/henrique/arduino-1.8.8/'
" ==================================================================================================================== VIM-PLUG
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/itchyny/lightline.vim.git'            " LIGHTLINE        : Statusline
Plug 'https://github.com/airblade/vim-gitgutter.git'           " GITGUTTER        : show symbols from git on the left
Plug 'https://github.com/kshenoy/vim-signature.git'            " VIM-SIGNATURE    : show bookmark symbols on the left
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'     " VIM-GUTENTAGS    : update tags automatically
Plug 'https://github.com/majutsushi/tagbar.git'                " TAGBAR           : bar with tags
Plug 'https://github.com/vim-syntastic/syntastic.git'          " SYNTASTIC        : syntax correction & lynting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " DEOPLETE         : async completion
      Plug 'zchee/deoplete-clang'                                " C/C++/C#
      Plug 'zchee/deoplete-jedi'                                 " Python
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'               " CTRL-P           : fuzzy file finder
Plug 'https://github.com/shinokada/dragvisuals.vim.git'        " DRAGVISUALS      : move selection
Plug 'https://github.com/godlygeek/tabular.git'                " TABULAR          : text filtering and alignment
Plug 'scrooloose/nerdtree'                                     " NERDTREE         : file explorer
      Plug 'Xuyuanp/nerdtree-git-plugin'                         " git symbols
" Plug 'dpelle/vim-LanguageTool'                                 " VIM-LANGUAGETOOL : more than a simple spell check
Plug 'https://github.com/SirVer/ultisnips.git'                 " ULTISNIPS        : snippets engine
      Plug 'https://github.com/honza/vim-snippets.git'           " Snippets
Plug 'https://github.com/fidian/hexmode.git'                   " HEXMODE          : editing binary files

Plug 'https://github.com/morhetz/gruvbox.git'                  " GRUVBOX          : colorscheme

" Plug 'https://github.com/neomake/neomake.git'                  " NEOMAKE          : async lynting and syntax correction

Plug 'https://github.com/stevearc/vim-arduino.git'             " VIM-ARDUINO      : ARDUINO IDE

" Initialize plugin system
call plug#end()

let g:languagetool_jar='$HOME/.config/nvim/LanguageTool-4.3/languagetool-commandline.jar'

" =================================================================================================================== SYNTASTIC
let g:syntastic_enable_ballons           = 1
let g:syntastic_loc_list_height          = 2
let g:syntastic_error_symbol             = '✖'
let g:syntastic_style_error_symbol       = '✖'
let g:syntastic_warning_symbol           = '!'
let g:syntastic_style_warning_symbol     = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 1
let g:syntastic_enable_highlighting      = 1

let g:syntastic_vhdl_checkers      = ['vcom']                                          " VHDL
let g:syntastic_cpp_checkers       = ['clang_check', 'gcc']                            " C++
let g:syntastic_c_checkers         = ['make']                    " C
let g:syntastic_tex_checkers       = ['chktex']                                        " LATEX
let g:syntastic_java_checkers      = ['javac']                                         " JAVA
let g:syntastic_python_python_exec = '/usr/bin/python3.5'                              " DEFINE PYTHON3 AS STANDARD
let g:syntastic_python_checkers    = ['python', 'pyflakes']                            " PYTHON

" =================================================================================================================== ULTISNIPS
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = "<c-space>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==================================================================================================================== DEOPLETE
let g:deoplete#enable_at_startup            = 1
"let g:deoplete#sources#clang#libclang_path = '/home/henrique/.config/nvim/clang/clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04/lib/libclang.so'
"let g:deoplete#sources#clang#clang_header  = '/home/henrique/.config/nvim/clang/clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04/include/'
let g:deoplete#sources#clang#libclang_path  = '/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header   = '/usr/include/clang/6.0.0/include/'

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
      \              [ 'filetype' ],
      \              [ 'syntastic' ],
      \              [ 'gutentag' ] ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'spell', 'tagbar' ] ]
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'gutentag': 'LightlineTags',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \   'arduino': 'warning',
      \ },
      \ 'component': {
      \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function LightlineTags()
    return '%{gutentags#statusline("[Generating\ tags...]")}'
endfunction

let g:lightline.inactive = {
	\ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ] ] 
    \}

let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ],
	\ 'right': [ [  ] ] }

"[arduino:avr:uno] [arduino:usbtinyisp] (/dev/ttyACM0:9600)
function! LightlineArduino()
  let port = arduino#GetPort()
  let line = '[' . g:arduino_board . '] [' . g:arduino_programmer . ']'
  if !empty(port)
    let line = line . ' (' . port . ':' . g:arduino_serial_baud . ')'
  endif
  return line
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" ================================================================================================================= COLORSCHEME
set termguicolors     " enable true colors support
set background=dark
colo gruvbox

" ====================================================================================================================== NEOMAKE
"call neomake#configure#automake('nrwi', 300)

" ========================================================================================================== CTRL-P FUZZY FINDER
let g:ctrlp_map               = '<c-f>'
let g:ctrlp_show_hidden       = 1 "Ignore dotfiles and dotdirs or not
let g:ctrlp_working_path_mode = ''

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

" =============================================================================================================== SET SKELETONS
autocmd BufNewFile  *.m	       0r ~/.config/nvim/skeleton/skeleton.m
autocmd BufNewFile  *.tex      0r ~/.config/nvim/skeleton/skeleton.tex
autocmd BufNewFile  *.vhd      0r ~/.config/nvim/skeleton/skeleton.vhd
autocmd BufNewFile  *.v        0r ~/.config/nvim/skeleton/skeleton.v
autocmd BufNewFile  *.cpp	   0r ~/.config/nvim/skeleton/skeleton.cpp
"autocmd BufNewFile  *.c	       0r ~/.config/nvim/skeleton/skeleton.c
autocmd BufNewFile  *.c	       0r ~/.config/nvim/skeleton/skeleton_doxy.c
autocmd BufNewFile  *.h	       0r ~/.config/nvim/skeleton/skeleton_doxy.h
"autocmd BufNewFile  *.h	       0r ~/.config/nvim/skeleton/skeleton.h
autocmd BufNewFile  *.adoc     0r ~/.config/nvim/skeleton/skeleton.adoc
autocmd BufNewFile  *.py       0r ~/.config/nvim/skeleton/skeleton.py
autocmd BufNewFile  *.pro      0r ~/.config/nvim/skeleton/skeleton.pro
autocmd BufNewFile  .gitignore 0r ~/.config/nvim/skeleton/skeleton.gitignore
autocmd BufNewFile  Makefile   0r ~/.config/nvim/skeleton/Makefile

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
set foldmethod=indent
set foldlevel=99

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
set textwidth=164   " max character in a line before auto breaking
set tabstop=4       " number of spaces inserted per tab
set shiftwidth=4    " number of spaces to indent after a line is broken
set expandtab       " insert spaces when tab is pressed

set softtabstop=4   " insert/delete 4 spaces when hitting a TAB/BACKSPACE

" ======================================================================================== ALWAYS SHOW TAB LINE AND CURRENT CMD 
set showtabline=2
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
hi clear SpellBad       " Word not recognised
hi clear SpellCap       " Word not capitalised
hi clear SpellRare      " Rare word
hi clear SpellLocal     " Wrong spelling for selected region

hi SpellBad    ctermfg=007      ctermbg=124    cterm=bold        guifg=NONE   guibg=NONE   gui=NONE
hi SpellCap    ctermfg=NONE     ctermbg=NONE   cterm=underline   guifg=NONE   guibg=NONE   gui=NONE
hi SpellRare   ctermfg=NONE     ctermbg=NONE   cterm=bold        guifg=NONE   guibg=NONE   gui=NONE
hi SpellLocal  ctermfg=NONE     ctermbg=NONE   cterm=italic      guifg=NONE   guibg=NONE   gui=NONE

" ==================================================================================================================== MAPPINGS 
imap <silent> <C-S>			<C-O>:update<CR>
map <silent> <C-S>			<Esc>:update<CR>
cmap <silent> <C-S>			:update<CR>

" Terminal
function T()
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

command! T call T()
command! VT call VT()
command! TSC call TSC()

" Escape
map 		  ßß			<Esc>
map! 		  ßß			<Esc>

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
map <C-]> :10sp <CR>:exec("tag ".expand("<cword>"))<CR>
" Open tag in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" ==================================================================================================================== MAPPINGS 
set wildignore+=*.a,*.o,*.elf
set wildignore+=*.bmp,*.gif,*.ico,*jpg,*jpeg,*.png
set wildignore+=*.git
set wildignore+=*~,*.swp,*.tmp

" ===================================================================================================================== HEXMODE
nnoremap <Leader>h :Hexmode<CR>
inoremap <Leader>h <Esc>:Hexmode<CR>
vnoremap <Leader>h :<C-U>Hexmode<CR>
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o'

" =============================================================================================================== LOCAL SCRIPTS
set exrc
set secure
