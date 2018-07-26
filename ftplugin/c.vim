" ===================================================== OMNICPPCOMPLETE ========================================================
call omni#cpp#complete#Init()

" configure tags - add additional tags here or comment out not-used ones set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/c
set tags+=~/.vim/tags/gtk

" build tags of your own project with Ctrl-F12
"ctags -R --sort=yes --c-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
