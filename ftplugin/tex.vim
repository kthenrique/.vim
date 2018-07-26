" ========================================= UPDATE SKELETONS ==================================================================
hi CursorLine   cterm=underline ctermbg=NONE ctermfg=NONE guibg=NONE guifg=white
hi CursorColumn cterm=NONE ctermbg=229 ctermfg=white guibg=NONE guifg=white

" ========================================= SET INDENTATION ===================================================================
" Start new file with all folded 
au BufEnter *.tex :normal zM

" Sets English as language for spell 
set spelllang=en,de
set spell

" ========================================= SET TEX_LIVE-PREVIEW ==============================================================
" Set update time
autocmd Filetype tex setl updatetime=1
" Set pdf viewer
let g:livepreview_previewer = 'evince'

