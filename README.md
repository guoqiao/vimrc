## clone this repo

    git clone https://github.com/guoqiao/vimx.git ~/.vim && cd ~/.vim

## install
install binary dependencies:

OS X:

    ./brew.sh

Ubuntu:

    ./apt-get.sh

Then install:

    ./install.sh

Install YouCompleteMe:

    bundle/YouCompleteMe/install.sh

That's all!

## basic usage
* leader: ,
* map ; to :, so you don't need to press shift for : each time.
* tabs: tn to new, tc to close, th to left, tl to right, tm to mv to last
* windows: ctrl + [hjkl]
* no highlight: ,h
* edit vimrc: ,ev
* 0 line begin, <space> to end
* visual select, then ,r to replace
* Ctrl + G to show current file path
* :ls list buffers(recently opened files)
* :b <file> open buffer, press tab to cycle between recent files

## plugin settings
* NERDTree: tt to toggle tree, ff to find file in tree(reveal)
* NERD-Commenter: leader + c + i
* YankRing: leader + p to open paste history, q to quit
* CtrlP: ctrl + p
* Emmet: ctrl + y + ,
* vim-indent-object: ii, ia
* vim-easymotion: ,,w
* vim-multiple-cursors: ctrl + n for next, ctrl + b for prev, ctrl + x to skip, esc
* tabular: :Tab/=, = is the char to align

pro only:
* tagbar: TT, show tags on right
* YouCompleteMe: ,j to jump to def

## Build latest vim
clipboard and python support are required in this config, to check your current vim:

    vim --version | grep clip
    vim --version | grep python

There should be a '+' sign before them. If not, build vim yourself:

    ./build-vim.sh

## Build latest ag|silver-searcher

    ./build-ag.sh
