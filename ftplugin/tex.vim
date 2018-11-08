" ========================================= SET INDENTATION ===================================================================
" Start new file with all folded 
au BufEnter *.tex :normal zM

" Sets English as language for spell 
set spelllang=en,de
set spell
set textwidth=90   " max character in a line before auto breaking

set thesaurus+=/home/henrique/.config/nvim/thesaurus/pg10681.txt
