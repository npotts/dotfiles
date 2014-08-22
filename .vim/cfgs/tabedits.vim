"Ctrl-Pgup/dn should change tabs
map <C-PageUp> :tabp<CR>
map <C-PageDown> :tabn<CR>
"ctrl-t opens a new tab
map <C-T> :tabnew<CR>
"ctrl-w closes the current tab
map <C-w> :tabclose!<CR>

"F12 closes current buffer, ignoreing any edits
map <F12> :bd!<CR>

"alt-pg up/down changes buffers in current tab
map <A-PageUp> :bn<CR>
map <A-PageDown> :bp<CR>

" F5 refreshes
map <F5> :e!<CR>


"Another potential for getting ctrl-z/x/c/v/s/o to work like windows
"source $VIMRUNTIME/mswin.vim
"behave mswin
"

"Other way of doing only a few bindings

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+;
imap <C-v> <C-r><C-o>+



" Commenting blocks of code.
"autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"autocmd FileType conf,fstab       let b:comment_leader = '# '
"autocmd FileType tex              let b:comment_leader = '% '
"autocmd FileType mail             let b:comment_leader = '> '
"autocmd FileType vim              let b:comment_leader = '" '
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
