" restore last cursor position
function! RESTORE_CURSOR()
    if line("'\"") > 0 && line ("'\"") <= line("$")
        exe "normal! g'\""
    endif
endfunction
autocmd BufReadPost * call RESTORE_CURSOR()

" navigate code using exuberant ctags
set tags=tags;$HOME
set tags+=$HOME/.vim/tags/cpp
set tags+=$HOME/.vim/tags/curl
set tags+=$HOME/.vim/tags/httpd
set tags+=$HOME/.vim/tags/libmozjs
set tags+=$HOME/.vim/tags/libxml2


