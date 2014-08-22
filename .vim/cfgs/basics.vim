"turn off wrapping.  its annoying
set nowrap

"turn on line numbers
set nu

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
colorscheme vividchalk

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


