" ======================================= PEP8 COMPLIANT ====================================================================
set tabstop=4     " a hard TAB displays as 4 columns
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set expandtab     " insert spaces when hitting TABs
"set textwidth=80  " lines longer than 79 columns will be broken
hi ColorColumn ctermbg=brown ctermfg=blue
call matchadd('ColorColumn', '\%81v', 100)

set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

" ======================================= START NEW FILE WITH ALL FOLDED ====================================================
"au BufEnter *.py :normal zM

" ============================================= USING UTF8 WITH PYTHON3 =====================================================
set encoding=utf-8

" ============================================= HIGHLIGHTING PYTHON3 ========================================================
let python_highlight_all=1

" ================================================ VIM-JEDI CONFIGs =============================================================
let g:jedi#popup_select_first = 0

