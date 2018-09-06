" ======================================== THIS MUST BE FIRST, BECAUSE IT CHANGES OTHER OPTIONS AS CONSEQUENCE set nocompatible
set t_Co=256

" =============================================================================================================== PATHOGEN CODE 
execute pathogen#infect()

" =============================================================================================================== SET SKELETONS
autocmd BufNewFile  *.m	       0r ~/.vim/skeleton/skeleton.m
autocmd BufNewFile  *.tex      0r ~/.vim/skeleton/skeleton.tex
autocmd BufNewFile  *.vhd      0r ~/.vim/skeleton/skeleton.vhd
autocmd BufNewFile  *.v        0r ~/.vim/skeleton/skeleton.v
autocmd BufNewFile  *.cpp	   0r ~/.vim/skeleton/skeleton.cpp
autocmd BufNewFile  *.c	       0r ~/.vim/skeleton/skeleton.c
autocmd BufNewFile  *.java     0r ~/.vim/skeleton/skeleton.java
autocmd BufNewFile  *.h	       0r ~/.vim/skeleton/skeleton.h
autocmd BufNewFile  *.adoc     0r ~/.vim/skeleton/skeleton.adoc
autocmd BufNewFile  *.py       0r ~/.vim/skeleton/skeleton.py
autocmd BufNewFile  *.pro      0r ~/.vim/skeleton/skeleton.pro
autocmd BufNewFile  .gitignore 0r ~/.vim/skeleton/skeleton.gitignore
autocmd BufNewFile  Makefile   0r ~/.vim/skeleton/Makefile

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

"make latex the standard tex
let g:tex_flavor='latex'

" =========================================================================================================== SHOW LINE NUMBERS 
" set hybrid line numbers
set number relativenumber

" set auto toggle of numbering mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" ================================================================ ALLOW HIDDEN BUFFERS, DON'T LIMIT TO 1 FILE PER WINDOW/SPLIT 
set hidden

" ======================================================================================================== SET THE COLOR SCHEME 
colo slate

" ====================================================================================================== CONFIGURING HIGHLIGHTS
" overriding search patterns highlights 
hi Search cterm=bold ctermfg=0 ctermbg=14

set hlsearch "highlight searches
set ignorecase "ignore case in search and replace
set smartcase "don't ignore case if Upper Case letters appear in search


" Settting background transparent
"hi Normal ctermbg=NONE

" Set the highlight for line number
set cul
hi clear CursorLine
augroup CLClear
        autocmd! ColorScheme * hi clear CursorLine
    augroup END
hi CursorLineNR cterm=bold
augroup CLNRSet
        autocmd! ColorScheme * hi CursorLineNR cterm=bold
    augroup END

" Reconfigure highlights for spells
hi clear SpellBad       " Word not recognised
hi clear SpellCap       " Word not capitalised
hi clear SpellRare      " Rare word
hi clear SpellLocal     " Wrong spelling for selected region

hi SpellBad    ctermfg=007      ctermbg=124    cterm=bold        guifg=NONE   guibg=NONE   gui=NONE
hi SpellCap    ctermfg=NONE     ctermbg=NONE   cterm=underline   guifg=NONE   guibg=NONE   gui=NONE
hi SpellRare   ctermfg=NONE     ctermbg=NONE   cterm=bold        guifg=NONE   guibg=NONE   gui=NONE
hi SpellLocal  ctermfg=NONE     ctermbg=NONE   cterm=italic      guifg=NONE   guibg=NONE   gui=NONE

" setting highlights for dropdown menu at code completion
hi Pmenu        cterm=NONE      ctermfg=037       ctermbg=016
hi PmenuSel     cterm=NONE      ctermfg=194       ctermbg=022
hi PmenuSbar    cterm=underline ctermfg=025       ctermbg=Green
hi PmenuThumb   cterm=bold      ctermfg=DarkGreen ctermbg=DarkGreen

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

" Open tag in a new vertical split
"map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Open tag in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" ==================================================================================================================== MAPPINGS 
set wildignore+=*.a,*.o,*.elf
set wildignore+=*.bmp,*.gif,*.ico,*jpg,*jpeg,*.png
set wildignore+=*.git
set wildignore+=*~,*.swp,*.tmp

" ============================================================================================== SET THE STATUSLINE [LIGHTLINE] 
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'darcula',
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

" ============================================================================================================= SUPERTAB CONFIG 
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"
au FileType *
            \ if &omnifunc != '' |
            \   let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>" |
            \   imap <tab> <c-x><c-n> |
            \ endif

let g:SuperTabLongestHighlight = 1

let g:SuperTabNoCompleteBefore = []
let g:SuperTabNoCompleteAfter  = ['^', ',', '\s']


" =============================================================================================================== SYNTASTIC CODE
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 2
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_ballons = 1

let g:syntastic_vhdl_checkers=['vcom']                              " VHDL
let g:syntastic_cpp_checkers=['clang_check', 'gcc']                 " C++
let g:syntastic_c_checkers=['make'] ", 'gcc'] , 'clang_check']        C
let g:syntastic_tex_checkers = ['pdflatex'] " , 'text/language_check'] LATEX

" let g:syntastic_text_checkers = ['language_check']             " TEXT
" let g:syntastic_text_language_check_args = '--language=en-US'

let g:syntastic_python_python_exec = '/usr/bin/python3.5'           " PYTHON
let g:syntastic_python_checkers=['python', 'pyflakes'] ",'flake8']             

" ================================================================================================== NETRW (NATIVE DIR EXPLORER)
" preferred view type
let g:netrw_liststyle = 3
" no banner
let g:netrw_banner = 0
" width of the directory explorer in percentage
let g:netrw_winsize = 25
" the hiden files
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+'

" ============================================================================================================ JAVA COMPLETION 2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" To add all missing imports with F6:
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" To remove all unused imports with F7:
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" ========================================================================================================= TMUX NAVIGATION CONF
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-w><c-w> :TmuxNavigatePrevious<cr>

" ========================================================================================================== CTRL-P FUZZY FINDER
let g:ctrlp_map='<c-f>'
let g:ctrlp_show_hidden = 1 "Ignore dotfiles and dotdirs or not

" ================================================================================================================= DRAG VISUALS
runtime plugin/dragvisuals.vim

vmap  <expr>  H        DVB_Drag('left')                     
vmap  <expr>  L        DVB_Drag('right')                    
vmap  <expr>  J        DVB_Drag('down')                     
vmap  <expr>  K        DVB_Drag('up')                       
vmap  <expr>  D        DVB_Duplicate()                      
                                                            
"Remove any introduced trailing whitespace after moving... 
let g:DVB_TrimWS = 1

" ====================================================================================================================== TAG BAR
nnoremap <silent> <F10> :TagbarToggle<CR>
let g:tagbar_sort = 0 " sort according to the order in source file

" =================================================================================================== PREVIM: MARKDOWN PREVIEWER
" Open firefox to preview
let g:previm_open_cmd = 'firefox'
" Update preview automatically
let g:previm_enable_realtime=1

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
