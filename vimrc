" Vundle is used here to manage packages:
" https://github.com/VundleVim/Vundle.vim
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

set nocompatible              " be iMproved
filetype off                  " required!
" let mapleader = "\<Space>"
let mapleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle, required!
Plugin 'matchit.zip' " % to match
Plugin 'repeat.vim' " . to repeat
Plugin 'surround.vim'
Plugin 'molokai'
Plugin 'colorizer'  " show color for css
Plugin 'python.vim'
Plugin 'vim-autopep8'  " F8 to format
Plugin 'vim-airline/vim-airline'
Plugin 'michaeljsmith/vim-indent-object'

" Async lint engine
Plugin 'w0rp/ale'
let g:ale_sign_column_always = 1

Plugin 'mattn/emmet-vim'  " Ctrl + y + ,
Plugin 'tpope/vim-fugitive'

Plugin 'easymotion/vim-easymotion'  " leader + leader + w
Plugin 'bronson/vim-trailing-whitespace'  " :FixWhitespace

Plugin 'The-NERD-tree'
let g:NERDTreeDirArrows=0
let g:NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map tt :NERDTreeToggle<CR>
map ff :NERDTreeFind<CR>

" <leader> p to show paste history
Plugin 'YankRing.vim'
let yankring_min_element_length=4
noremap <leader>p :YRShow<CR>

Plugin 'The-NERD-Commenter'  " leader + c + i to toggle comment
let NERDSpaceDelims = 1  " add space after comment delim for pep8

Plugin 'airblade/vim-gitgutter'

Plugin 'majutsushi/tagbar'
map TT :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_foldlevel = 0

Plugin 'ctrlpvim/ctrlp.vim'  " ctrl + p to search
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_tabpage_position  = 'a'
let g:ctrlp_working_path_mode = 0

if executable('ag')

    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    let g:ctrlp_use_caching = 0
    let g:ctrlp_user_command = 'ag %s --nogroup --hidden
          \ --ignore .git
          \ --ignore .DS_Store
          \ --ignore __pycache__
          \ --ignore "**/*.pyc"
          \ -g ""'
endif

Plugin 'SirVer/ultisnips'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = 'python'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_filetype_whitelist = { 'python':1 }
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_ultisnips_completer = 1
nnoremap <leader>j :YcmCompleter GoToDefinition<CR>

call vundle#end()
filetype plugin indent on     " required!

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

" map to middle click on linux
set clipboard=unnamed

set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set iskeyword+=-
set encoding=utf8
set ffs=unix,dos,mac
set laststatus=2
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
set lazyredraw
set tags=tags

" Turn backup off, since most stuff is in git.
set nowb
set nobackup
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

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

autocmd FileType html,xml,yaml,css,scss,javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType c setlocal shiftwidth=8 softtabstop=8 tabstop=8 noexpandtab


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

noremap <leader>h :noh<CR>
noremap <leader>w :w<CR>
noremap <leader>e :e!<CR>
noremap <leader>q :q<CR>
noremap <leader>x :x<CR>

noremap <leader>ev :e $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

map <leader>pp :setlocal paste!<cr>
map <leader>ss :setlocal spell!<cr>

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
