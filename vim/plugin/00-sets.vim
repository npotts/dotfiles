
let g:gfm_syntax_enable_always = 1
let g:gfm_syntax_enable_filetypes = ['markdown.gfm']
let g:markdown_fenced_languages = ['cpp', 'go', 'json', 'sh']

let g:gfm_syntax_highlight_inline_code = 1 "If 0, inline codes won't be highlighted.
let g:gfm_syntax_highlight_mention = 1 "	If 0, mentions won't be highlighted.
let g:gfm_syntax_highlight_strikethrough = 1 "	If 0, strikethrough won't be highlighted.
let g:gfm_syntax_highlight_emoji = 1 "	If 0, emojis won't be highlighted.
let g:gfm_syntax_highlight_table = 1 "	If 0, tables won't be highlighted.
let g:gfm_syntax_highlight_issue_number	= 1 "If 0, issue number won't be highlighted
let g:gfm_syntax_highlight_checkbox = 1 "If 0, check box won't be highlighted= 1 "
let g:gfm_syntax_emoji_conceal = 1 "  emojis such as :dog:
" .md means markdown not modula....
autocmd BufRead,BufNew,BufNewFile *.md set ft=markdown.gfm


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

set formatoptions="n1jtcoql" "leave off r since that gets annoting with /**/ type comments
set colorcolumn=85

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
" per https://github.com/dracula/vim/issues/65 - We really dont want
" a really ugly brown background color - so turn it off
" let g:dracula_colorterm=0
" colorscheme dracula
"let g:nord_italic = 1
"let g:nord_underline = 1
"let g:nord_italic_comments = 1
"let g:nord_comment_brightness = 20

colorscheme nord


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
"set mouse=in
" set mouse-=a
set mouse=




