set number " I like numbers
set nowrap " wrapping is usually a bad idea
set tabstop=4 " 4 spaces is sufficient
syntax on "syntax is useful
filetype plugin indent on
set showcmd "show the <leader> and cmd seq in bottom right corner

" .md means markdown not modula....
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


"vim-go settings"
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']"
let g:go_version_warning = 0 " for now dont warn about old versions

