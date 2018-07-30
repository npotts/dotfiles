
" .md means markdown not modula....
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile


"vim-go settings"
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']"
let g:go_version_warning = 0 " for now dont warn about old versions

" loose focus = save
au FocusLost * :wa

set number " I like numbers
set nowrap " wrapping is usually a bad idea
syntax on "syntax is useful
filetype plugin indent on
set showcmd "show the <leader> and cmd seq in bottom right corner
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

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set formatoptions=qrn1
set colorcolumn=85

let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }

colorscheme dracula


" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" Just say no to \t: For everything else, use a tab width of 4 space chars.
set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2    " Indents will have a width of 4.
set softtabstop=2   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.



" Folding goodness.  Helpful keybindings: 
" z+o open fold at curser
" z+O opens all folds at curser
" z+c close fold at curser
" z+m increase fold level by 1
" z+M closes all folds
" z+r decrease fold level by 1
" z+R decrese foldlevel to zero: open all folds
set foldmethod=indent
"set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" never use the mouse to go into visual mode.  Its obnoxious as best
set mouse=in
" set mouse-=a

