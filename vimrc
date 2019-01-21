" load vundle plugins if available
if filereadable(expand("~/.vim/vimrc.vundle"))
  source ~/.vim/vimrc.vundle
endif

syntax on
syntax enable
set scrolloff=10
set ruler
set number
set relativenumber
set hidden
set nowrap
set autoread
set cursorline
set signcolumn=yes
set showcmd
set history=9999
set undolevels=32

" map to middle click on linux
set clipboard=unnamed

set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set iskeyword+=-
set encoding=utf8
set ffs=unix,dos,mac
set laststatus=2

" list mode, show tabs and spaces
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

set lazyredraw
set tags=tags

" Turn backup off, since most stuff is in git.
set nobackup
set nowritebackup
set noswapfile

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

set ignorecase
set smartcase
set hlsearch
set incsearch

set smarttab
set autoindent
set smartindent
set copyindent
set cindent
set foldmethod=indent
set foldlevel=99

" default indent 4-space
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" frontend indent 2-space
autocmd FileType html   setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
" c indent 8-space
autocmd FileType c      setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab


nnoremap ; :
nnoremap 0 ^
nnoremap <Space> $
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Smart way to manage tabs
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap tm :tabmove<CR>
nnoremap to :tabonly<CR>

let loaded_matchparen = 1 " disable math parenthiese

" let mapleader = "\<Space>"
let mapleader = ","

noremap <leader>h :noh<CR>
noremap <leader>w :w<CR>
noremap <leader>e :e!<CR>
noremap <leader>q :q<CR>
noremap <leader>x :x<CR>

noremap <leader>ev :e $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

set pastetoggle=<F2>

set t_Co=256
set guioptions-=r
set guioptions-=L

try
    colorscheme molokai
catch
    colorscheme desert
endtry
set background=dark

" add transparency, must be after colorscheme
highlight Normal guibg=NONE ctermbg=NONE
highlight ColorColumn ctermbg=red
set colorcolumn=80

autocmd! bufwritepost vimrc source %
" com! FJ %!python -m json.tool

cmap w!! w !sudo tee > /dev/null %

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
