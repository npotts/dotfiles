" Remap <ESC> to Ctrl-Space in insert mode
inoremap <C-@> <ESC>

"Likewise, in normal mode, drop into insert mode
nnoremap <C-@> a


"Ctrt-w closes current buffer, without saving
"nnoremap <C-w> :bd!<CR>
"imap <C-w> <ESC><C-w><CR>


"Rather than use Ctrl-W-CtrW to move around, use Ctrl-`
"noremap <C-`> <C-w>
