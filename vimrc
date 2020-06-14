set nocompatible
syntax on
syntax enable
filetype indent on

" bottom status bar
set showmode
set showcmd
set ruler
set laststatus=2
set scrolloff=10

" left side bar
set number
set relativenumber
" vi doesn't support this
" set signcolumn=yes

" middle working area
set lazyredraw
set undolevels=32
set backspace=eol,start,indent
set iskeyword+=-
" list mode, show tabs and spaces
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
" this will force cursor jump to new line
" set textwidth=80
set nowrap
set linebreak

set background=dark
" :colorscheme <Tab> --> list all
" /usr/share/vim/vim80/colors
colorscheme desert

" file
set hidden
set autoread
set wildignore=*.o,*~,*.pyc
set encoding=utf8
set ffs=unix,dos,mac
" Turn backup off, since most stuff is in git.
set nobackup
set nowritebackup
set noswapfile
" make it possible to undo when reopen
set undofile
" // indicates that the file has abs path(?)
set undodir=~/.vim/.undo//

" :ls :buffers
" :bn(ext) :bp(rev)
" b <Tab>
" b xx<Tab>
set wildmenu
set wildmode=longest:list,full
set wildchar=<Tab> wildcharm=<C-Z>

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" search
" with ingorecase if all lowercase, otherwise case sensitive
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" add all files to find path
" :find  FILE -> find FILE and open in current window
" :sfind FILE -> find FILE and open in split
" :tabf  FILE -> find FILE and open in tab
set path=$PWD/**
" enable wildmenu above status bar
set wildmenu
" press Tab once: show list for all match as prompt
" press Tab twice: show wildmenu for all match and use Tab again to nav
set wildmode=list:longest,full

" set foldenable
" set foldmethod=indent
" set foldlevelstart=6
" set foldlevel=99
" set foldnestmax=10

" default indent 4-space
set autoindent
set smartindent
set copyindent
set cindent

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" frontend indent 2-space
autocmd FileType html,yaml   setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
" c indent 8-space
autocmd FileType c      setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab

set history=9999
set tags=tags

" map to middle click on linux
set clipboard=unnamed
" FIX: right click will enter visual mode in vim8
set mouse-=a

nnoremap ; :

nnoremap 0 ^
nnoremap <Space> $

nnoremap B ^
nnoremap E $

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

" add transparency, must be after colorscheme
highlight Normal guibg=NONE ctermbg=NONE
highlight ColorColumn ctermbg=red
set colorcolumn=80

" cursor shape and color
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" only show cursorline in insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

autocmd! bufwritepost vimrc source %
command FJ % !python3 -m json.tool

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


" goog vim reference
" https://www.tutorialdocs.com/article/vim-configuration.html

" load plugins if available
if filereadable(expand("~/.vim/vimrc.plugins"))
  source ~/.vim/vimrc.plugins
endif
