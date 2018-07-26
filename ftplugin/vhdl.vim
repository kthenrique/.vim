" ============================================= SET THE INDENTATION SPACE ========================================================
set tabstop=2     " number of spaces inserted per tab
set shiftwidth=2  " number of spaces to indent after a line is broken
set expandtab     " insert spaces when tab is pressed
"set textwidth=80  " max character in a line
hi ColorColumn ctermbg=blue ctermfg=white
call matchadd('ColorColumn', '\%81v', 100)
"exec 'set colorcolumn=' . join(range(2,80,3), ',') -- Prank

set autoindent    " align the new line indent with the previous line
set softtabstop=2 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
