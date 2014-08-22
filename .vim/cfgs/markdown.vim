"install the needed plugin via Vundle
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" associate *.foo with php filetype
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.markdown set filetype=markdown

let g:vim_markdown_folding_disabled=1
