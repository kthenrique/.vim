" ========================================================= THIS MUST BE FIRST, BECAUSE IT CHANGES OTHER OPTIONS AS CONSEQUENCE 
set t_Co=256

" ==================================================================================================================== VIM-PLUG
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'https://github.com/itchyny/lightline.vim.git'            " Lightline     : Statusline
Plug 'https://github.com/kshenoy/vim-signature.git'            " Vim-Signature : show bookmark symbols on the left
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'     " Vim-GutenTags : update tags automatically
Plug 'https://github.com/majutsushi/tagbar.git'                " TagBar        : bar with tags
Plug 'https://github.com/neomake/neomake.git'                  " NeoMake       : async lynting and syntax correction
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " Deoplete      : async completion
      Plug 'zchee/deoplete-clang'                                " C/C++/C#
      Plug 'zchee/deoplete-jedi'                                 " Python
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'               " Ctrl-P        : fuzzy file finder
Plug 'https://github.com/shinokada/dragvisuals.vim.git'        " DragVisuals   : move selection
Plug 'https://github.com/airblade/vim-gitgutter.git'           " GitGutter     : show symbols from git on the left
Plug 'scrooloose/nerdtree'                                     " NerdTree      : file explorer
      Plug 'Xuyuanp/nerdtree-git-plugin'                         " git symbols

Plug 'dpelle/vim-LanguageTool'
Plug 'https://github.com/morhetz/gruvbox.git'                  " Gruvbox       : colorscheme

Plug 'https://github.com/SirVer/ultisnips.git'                 " UltiSnips     : snippets engine
      Plug 'https://github.com/honza/vim-snippets.git'           " Snippets

" Initialize plugin system
call plug#end()

let g:languagetool_jar='$HOME/.config/nvim/LanguageTool-4.3/languagetool-commandline.jar'

" =================================================================================================================== ULTISNIPS
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==================================================================================================================== DEOPLETE
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/6.0.0/include/'

" ================================================================================================================= COLORSCHEME
set termguicolors     " enable true colors support
colo industry
colo gruvbox

" ============================================================================================== SET THE STATUSLINE [LIGHTLINE] 
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ]],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'spell' ] ]
      \ },
      \ }

let g:lightline.inactive = {
	\ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ] ] 
    \}

let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ],
	\ 'right': [ [  ] ] }

" ====================================================================================================================== NEOMAKE
call neomake#configure#automake('nrwi', 300)

" ================================================================================================== NETRW (NATIVE DIR EXPLORER)
" preferred view type
let g:netrw_liststyle = 3
" no banner
let g:netrw_banner = 0
" width of the directory explorer in percentage
let g:netrw_winsize = 25
" the hiden files
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

" ========================================================================================================== CTRL-P FUZZY FINDER
let g:ctrlp_map='<c-f>'
let g:ctrlp_show_hidden = 1 "Ignore dotfiles and dotdirs or not
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
"map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Open tag in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" ==================================================================================================================== MAPPINGS 
set wildignore+=*.a,*.o,*.elf
set wildignore+=*.bmp,*.gif,*.ico,*jpg,*jpeg,*.png
set wildignore+=*.git
set wildignore+=*~,*.swp,*.tmp

" ================================================================================================= HEX DUMP MODE (experimental)
nnoremap <Leader>h :Hexmode<CR>
inoremap <Leader>h <Esc>:Hexmode<CR>
vnoremap <Leader>h :<C-U>Hexmode<CR>
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
    " hex mode should be considered a read-only operation
    " save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1
    if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary " make sure it overrides any textwidth, etc.
        silent :e " this will reload the file without trickeries 
        "(DOS line endings will be shown entirely )
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
    else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
            setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
    endif
    " restore values for modified and read only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction
