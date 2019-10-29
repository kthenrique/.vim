set autoindent     " align the new line indent with the previous line
set textwidth=82   " max character in a line before auto breaking
set tags+=.tivatags

let g:ale_linters = {
  \   'c'       : ['clangtidy', 'cppcheck', 'gcc', 'clang'],
  \   'cpp'     : ['clangtidy', 'cppcheck', 'gcc', 'clang'],
  \}

let g:ale_c_gcc_executable= "arm-none-eabi-gcc"
let g:ale_c_gcc_options= "-Wpedantic -Wpedantic -Wextra -Wmissing-prototypes -Wshadow -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --define=PART_TM4C1294NCPDT -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi -z --heap_size=0 --stack_size=512 --reread_libs --diag_wrap=off --display_error_number --warn_sections"
