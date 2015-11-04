source ~/.vim/vimrc.basic

" apt-get install exuberant-ctags
Plugin 'majutsushi/tagbar'
map TT :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

Plugin 'Valloric/YouCompleteMe'
let g:ycm_filetype_whitelist = { 'python':1 }
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>

" apt-get|brew install silversearcher-ag
let g:ctrlp_user_command = 'ag %s -S --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

