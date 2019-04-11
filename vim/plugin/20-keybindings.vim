" leader-> ' ' 
let mapleader = ' '


" jj in Insert mode issues an <ESC> 
inoremap jj <ESC>
vnoremap jj <ESC>
vnoremap // <ESC>

nnoremap <leader>w :w!<CR>

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

"nmap <C-q> :q!<CR>
"imap <C-q> <ESC>:q!<CR>
nnoremap <C-~> :q!<CR>
inoremap <C-~> <ESC>:q!<CR>

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
nnoremap <leader>W <C-w>v<C-w>l
nnoremap <leader>H <C-w>s<C-w>j


"NerdCommenter bindings.  
nmap <D-/> <Plug>NERDCommenterToggle
nmap <C-/>  <Plug>NERDCommenterToggle
imap <D-/> <ESC><Plug>NERDCommenterToggle<CR>a
imap <C-/>  <ESC><Plug>NERDCommenterToggle<CR>a


"leader-b-n: go to next buffer view
nnoremap <leader>n :bn!<CR>
nnoremap <leader>p :bp!<CR>
"move to the another (next) buffer, and kill the one we just left
nnoremap <leader>d :bn\|bd! #<CR>
nnoremap <leader>D :bd!<CR>

"likewise, move around in tabs
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tc :tabe!<CR>


" ctrl-g drops to vim cmd entry
inoremap <C-g> <ESC>:
nnoremap <C-g> <ESC>:
vnoremap <C-g> <ESC>:


"b normally builds, B TestCompiles 
nnoremap <leader>B :GoTestCompile<CR>
nnoremap <leader>t :GoCoverage<CR>
nnoremap <leader>T :GoCoverageToggle<CR>


"normally causes visual selection mode -> NOOP
inoremap <LeftMouse> <Esc>   
"normally causes visual word selection mode
inoremap <2-LeftMouse> <Esc>
"normally causes visual line selection mode
inoremap <3-LeftMouse> <Esc> 
"normally causes visual block selection mode
inoremap <4-LeftMouse> <Esc> 

"Ctrl-W in insert means exit and reissue C-W in normal
inoremap <C-w> <ESC><C-w>
vnoremap <C-w> <ESC><C-w>

"command-t binding 
nnoremap <F1> :CommandT<CR>
nnoremap <F2> :CommandTCommand<CR>
