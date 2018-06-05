" leader-> ' ' 
let mapleader = ' '


" jj in Insert mode issues an <ESC> 
inoremap jj <ESC>

"in go FileType, <leader>-b and r run build and go-build and go-run
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
"Ctl-n and Ctl-m do next and prev error
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Ctrl-K means close buffer
nmap <C-k> :bd!<CR>
imap <C-k> <ESC>:bd!<CR>



" leader-cd changes to the directory of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


" leader-e sources vim config
nnoremap <leader>sv :source $MYVIMRC<CR>


" better searching using normal regex's
nnoremap / /\v
vnoremap / /\v
" remap leader-space to stop highlighting
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %


" This first mapping makes ,w open a new vertical
" split and switch over to it. Because really, how
" often do you split your window and not want to do
" something in the new split?
nnoremap <leader>w <C-w>v<C-w>l


"NerdCommenter bindings.  
nmap <D-/> <Plug>NERDCommenterToggle
nmap <C-/>  <Plug>NERDCommenterToggle
imap <D-/> <ESC><Plug>NERDCommenterToggle<CR>a
imap <C-/>  <ESC><Plug>NERDCommenterToggle<CR>a
