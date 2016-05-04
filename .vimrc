
colorscheme badwolf
syntax on

" Don't try to be vi
set nocompatible

" Whitespace 
set tabstop=4
set softtabstop=4
set expandtab
set nu
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch

" Search options
set incsearch
set hlsearch

" Fold settings
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" Mutli-line wraps saved correctly
nnoremap j gj
nnoremap k gk

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
