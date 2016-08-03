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
let mapleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required!
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-indent-object'
Plugin 'matchit.zip'
Plugin 'repeat.vim'
Plugin 'surround.vim'
Plugin 'molokai'
Plugin 'peaksea'
Plugin 'colorizer'
Plugin 'python.vim'
" F8
Plugin 'vim-autopep8'

Plugin 'syntastic'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pyflakes']
" display all errors from all checkers together
let g:syntastic_aggregate_errors = 0
" disable all style messages
" let g:syntastic_quiet_messages = { "type": "style" }

Plugin 'mattn/emmet-vim'
" :Tab/= to align to =
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
" leader + leader + w
Plugin 'easymotion/vim-easymotion'
Plugin 'bronson/vim-trailing-whitespace'

Plugin 'The-NERD-tree'
let g:NERDTreeDirArrows=0
let g:NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" tt to toggle tree
map tt :NERDTreeToggle<CR>
" ff to find/reveal current file in tree
map ff :NERDTreeFind<CR>

" <leader> p to show paste history
Plugin 'YankRing.vim'
let yankring_min_element_length=4

" leader + c + i to toggle comment
Plugin 'The-NERD-Commenter'
" add space after comment delim for pep8
let NERDSpaceDelims = 1

Plugin 'airblade/vim-gitgutter'
let g:gitgutter_sign_column_always = 1

Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plugin 'majutsushi/tagbar'
map TT :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_foldlevel = 0

" ctrl + p to search
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_tabpage_position  = 'a'
let g:ctrlp_working_path_mode = 'ra'

if executable('ag')

    let g:ctrlp_user_command = 'ag %s -S --nocolor --nogroup --hidden
          \ --ignore .git
          \ --ignore .svn
          \ --ignore .hg
          \ --ignore .DS_Store
          \ --ignore "**/*.pyc"
          \ -g ""'
endif

Plugin 'Valloric/YouCompleteMe'
let g:ycm_filetype_whitelist = { 'python':1 }
" very useful
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>

call vundle#end()
filetype plugin indent on     " required!

syntax on
syntax enable
set so=10
set ruler
set number
set relativenumber
set hidden
set nowrap
set autoread
set cursorline
set shell=/bin/bash
set clipboard=unnamed
set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set iskeyword+=-
set encoding=utf8
set ffs=unix,dos,mac
set laststatus=2
set textwidth=120
set foldmethod=indent
set foldlevel=99
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Turn backup off, since most stuff is in SVN, git etc.
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
let loaded_matchparen = 1 " disable math parenthiese

set expandtab
set smarttab
set autoindent
set smartindent
set copyindent
set shiftwidth=4
set tabstop=4

nnoremap ; :
nnoremap 0 ^
nnoremap <space> $

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

noremap <leader>p :YRShow<CR>
noremap <leader>h :noh<CR>

noremap <leader>ev :e $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

map <leader>pp :setlocal paste!<cr>
map <leader>ss :setlocal spell!<cr>

set t_Co=256
set guifont=Monaco:h16
" set guifont=Source\ Code\ Pro\ 16
set guioptions-=r
set guioptions-=L

try
    colorscheme molokai
catch
    colorscheme desert
endtry
set background=dark

autocmd! bufwritepost vimrc source %
com! FJ %!python -m json.tool

" Highlight whitespace at the end of lines
" au BufRead,BufNewFile *.py, *.md, *.html, *.css, *.scss, *.js match BadWhitespace /\s\+$/

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

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  env = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(env, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
