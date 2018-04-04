" This first mapping makes ,w open a new vertical
" split and switch over to it. Because really, how
" often do you split your window and not want to do
" something in the new split?

nnoremap <leader>w <C-w>v<C-w>l

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
