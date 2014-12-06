set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" find popular plugins here:
"http://vim.sourceforge.net/scripts/script_search_results.php?order_by=rating

" vim-scripts repos
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'wesleyche/SrcExpl'

" ctrlp and yr both use ctrl+p, last one will override
Bundle 'YankRing.vim'
Bundle 'kien/ctrlp.vim'

Bundle 'molokai'
Bundle 'peaksea'
Bundle 'colorizer'
Bundle 'pyflakes.vim'
Bundle 'python.vim'
Bundle 'plasticboy/vim-markdown'

Bundle 'matchit.zip'
Bundle 'repeat.vim'
Bundle 'surround.vim'

" GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'mattn/emmet-vim'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets'
Bundle 'guoqiao/snipmate_for_django'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

syntax on
syntax enable
set so=10
set ruler
set number
set nowrap
set hidden
set autoread
set autochdir
set clipboard=unnamed
set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set iskeyword+=-
set encoding=utf8
set ffs=unix,dos,mac
set laststatus=2
set tags=tags;
set autochdir

" Turn backup off, since most stuff is in SVN, git et.c anyway...
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
set smartindent
set shiftwidth=4
set tabstop=4

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Smart way to manage tabs
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap tm :tabmove<CR>
nnoremap to :tabonly<CR>

nnoremap ; :
map 0 ^
map 9 $

let mapleader = ","
nnoremap <leader>h :noh<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <silent> <leader>ev :e  $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
autocmd! bufwritepost vimrc source %

set t_Co=256
set guifont=Monaco:h12
set guioptions-=r
set guioptions-=L

try
    colorscheme molokai
catch
    colorscheme desert
endtry
set background=dark

" plugin settings

" YouCompleteMe
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>

"au BufNewFile,BufRead *.html set filetype=htmldjango
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" YankRing
map <leader>y :YRShow<CR>
let yankring_min_element_length=4

" nerd tree
let g:NERDTreeDirArrows=0
"map tt :NERDTreeToggle<CR>
nmap <F8>f :NERDTreeToggle<CR>

" taglist.vim
"map TT :TlistToggle<CR>
nmap <F8>t :TlistToggle<CR>
"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Inc_Winwidth = 0
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1

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

"cscope 
nmap <F3>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
nmap <F3>d :cs find d <C-R>=expand("<cword>")<CR><CR>  
nmap <F3>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
nmap <F3>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
nmap <F3>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <F3>i :cs find i <C-R>=expand("<cfile>")<CR><CR>  
nmap <F3>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
nmap <F3>t :cs find t <C-R>=expand("<cword>")<CR><CR>  

"Auto Load CScope, search ancestor dirs if needed 
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
"au BufEnter /* call LoadCscope()
nmap <F3>l :call LoadCscope()<CR>

"tagbar 
nmap <F8>p :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 30

" SrcExpl
nmap <F8>s :SrcExplToggle<CR> 

let g:SrcExpl_winHeight = 8 
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_searchLocalDef = 1 
let g:SrcExpl_isUpdateTags = 0 

let g:SrcExpl_jumpKey = "<ENTER>" 
let g:SrcExpl_gobackKey = "<SPACE>" 
let g:SrcExpl_updateTagsKey = "<F11>u" 
let g:SrcExpl_prevDefKey = "<F11>b" 
let g:SrcExpl_nextDefKey = "<F11>f" 
"
" // In order to avoid conflicts, the Source Explorer should know what plugins " 
" // except itself are using buffers. And you need add their buffer names into " 
" // below listaccording to the command ":buffers!"                            " 
 let g:SrcExpl_pluginList = [ 
         \ "__Tag_List__", 
         \ "_NERD_tree_" 
     \ ] 
"                                                                              " 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to " 
" //  create/update a tags file                                                " 
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

