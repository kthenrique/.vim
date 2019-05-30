" configure tags - add additional tags here or comment out not-used ones set tags+=~/.vim/tags/cpp
"set tags+=../tags/gtk
set keywordprg=:Man
set tags+=~/.config/nvim/tags/linux

" Update path to common inclusion path names
set path+=**/inc
set path+=**/include

" build tags of your own project with Ctrl-F12
nnoremap <silent> <F12> :silent !cd `git rev-parse --show-toplevel` && ctags -R --sort=yes --c-kinds=+p --c-kinds=+x --fields=+S -L `git ls-files` <CR>
