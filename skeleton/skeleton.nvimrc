set autoindent     " align the new line indent with the previous line
set textwidth=82   " max character in a line before auto breaking
set tags+=.tivatags

let g:ale_linters = {
  \   'c'       : ['clangtidy', 'cppcheck', 'gcc', 'clang'],
  \   'cpp'     : ['clangtidy', 'cppcheck', 'gcc', 'clang'],
  \}

let g:ale_c_gcc_executable= "arm-none-eabi-gcc"
let g:ale_c_gcc_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow -DPART_TM4C1294NCPDT -I/home/henrique/ti/tivaware_c_series_2_1_4_178/"
let g:ale_cpp_gcc_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow -DPART_TM4C1294NCPDT -I/home/henrique/ti/tivaware_c_series_2_1_4_178/"
let g:ale_c_clang_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow -DPART_TM4C1294NCPDT -I/home/henrique/ti/tivaware_c_series_2_1_4_178/"
let g:ale_cpp_clang_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow -DPART_TM4C1294NCPDT -I/home/henrique/ti/tivaware_c_series_2_1_4_178/"
let g:ale_c_clangtidy_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow -DPART_TM4C1294NCPDT -I/home/henrique/ti/tivaware_c_series_2_1_4_178/"
let g:ale_cpp_clangtidy_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow -DPART_TM4C1294NCPDT -I/home/henrique/ti/tivaware_c_series_2_1_4_178/"
