set autoindent     " align the new line indent with the previous line
set textwidth=82   " max character in a line before auto breaking
set tags+=.tivatags

let g:ale_linters = {
  \   'c'       : ['clangtidy', 'cppcheck', 'gcc', 'clang'],
  \   'cpp'     : ['clangtidy', 'cppcheck', 'gcc', 'clang'],
  \}

let g:ale_c_gcc_executable= "arm-none-eabi-gcc"
let g:ale_c_gcc_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow"
