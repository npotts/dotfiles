" leader-> ' ' 
let mapleader = ' '


" jj in Insert mode issues an <ESC> 
inoremap jj <ESC>

"Likewise, in normal mode, drop into insert mode
" nnoremap <C-@> a


"Ctrt-w closes current buffer, without saving
"nnoremap <C-w> :bd!<CR>
"imap <C-w> <ESC><C-w><CR>


"Rather than use Ctrl-W-CtrW to move around, use Ctrl-`
"noremap <C-`> <C-w>
"
"
"



"in go FileType, <leader>-b and r run build and go-build and go-run
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
"Ctl-n and Ctl-m do next and prev error
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


