
execute pathogen#infect()
syntax on
filetype plugin indent on

" .md means markdown not modula....
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']"



let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
