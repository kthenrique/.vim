" configure tags - add additional tags here or comment out not-used ones set tags+=~/.vim/tags/cpp
set keywordprg=Cppman
set tags+=~/.vim/tags/qt5
"set tags+=~/.vim/tags/opencv

" Update path to common inclusion path names
set path+=**/inc
set path+=**/include

" build tags of your own project with Ctrl-F12
nnoremap <silent> <F12> :!cd `git rev-parse --show-toplevel` && ctags -R --sort=yes --c++-kinds=+p --c++-kinds=+x --fields=+S --fields=+a --fields=+i --extra=+q -L `git ls-files` <CR>
