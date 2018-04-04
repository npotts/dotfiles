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

" loose focus = save
au FocusLost * :wa




set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" remap leader-space to stop highlighting
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %


set formatoptions=qrn1
set colorcolumn=85
