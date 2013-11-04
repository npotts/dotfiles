"turn off wrapping.  its annoying
set nowrap

"auto completion

filetype plugin on
set ofu=syntaxcomplete#Complete


" vi-improved mode
set nocompatible

" cycle buffers without writing
set hidden

" backup while writing
set writebackup

" file completion
set wildmenu
set wildmode=list:longest

" update window title
set title

" display cursor location
set ruler

" display current command

set showcmd

" short message prompts
set shortmess=atI

" silent
set noerrorbells

" switch to current file's directory
set autochdir

" remember marks, registers, searches, buffer list
set viminfo='20,<50,s10,h,%

" keep a big history
set history=1000

" syntax highligting
syntax on
colorscheme delek

" auto smart code indent
set autoindent
filetype indent on
set smartindent
set smarttab
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set shiftround

" allow backspacing in insert mode
set backspace=indent,eol,start

" incremental search
set incsearch
set nohlsearch

" ignore case
set ignorecase
set smartcase

" restore last cursor position
function! RESTORE_CURSOR()
    if line("'\"") > 0 && line ("'\"") <= line("$")
        exe "normal! g'\""
    endif
endfunction
autocmd BufReadPost * call RESTORE_CURSOR()

" navigate code using exuberant ctags
set tags=tags;$HOME
set tags+=$HOME/.vim/tags/cpp
set tags+=$HOME/.vim/tags/curl
set tags+=$HOME/.vim/tags/httpd
set tags+=$HOME/.vim/tags/libmozjs
set tags+=$HOME/.vim/tags/libxml2
