" Enable syntax processing
syntax enable

" Highlight current line
set cursorline

" Remap arrow keys to do nothing.
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Number of visual spaces per tab
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Change tabs to spaces
set expandtab

" load filetype-specific indent files
filetype indent on

" Visual autocomplete for command menu
set wildmenu

" Redraw only when we need to
set lazyredraw

" Higlight matching bracket/paren/etc
set showmatch

" --- SEARCHING ---

" Search as characters are entered
set incsearch

" Highlight search matches
set hlsearch

" --- MOVEMENT ---

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Highlight last inserted text
nnoremap gV `[v`]

" --- OTHER STUFF ---

" Move vim backup files to /tmp

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
