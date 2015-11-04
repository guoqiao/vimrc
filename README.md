## clone this repo

    cd ~
    git clone https://github.com/guoqiao/vimx.git .vim
    cd .vim

## install basic version
backup your .vimrc and .vim first, and then:

    ln  -s vim.basic vimrc
    ./install.sh

## install pro version
Install dependencies:

OS X:

    brew install the_silver_searcher

Ubuntu:

    apt-get install exuberant-ctags silversearcher-ag

Then link and install:
    ln  -s vim.pro vimrc
    ./install.sh

That's all!

## basic usage
* leader: ,
* map ; to :
* tabs: tn to new, tc to close, th to left, tl to right, tm to mv to last
* windows: ctrl + [hjkl]
* no highlight: ,h
* edit vimrc: ,ev

## plugin settings
* NERDTree: tt to toggle tree, ff to find file in tree
* NERD-Commenter: leader + c + i
* YankRing: leader + p to open paste history, q to quit
* CtrlP: ctrl + p
* Emmet: ctrl + y + ,
* Ack: use Ack FOOBAR to search on cmdline
* vim-indent-object: ii, ia
* vim-easymotion: ,,w
* vim-multiple-cursors: ctrl + n for next, ctrl + b for prev, ctrl + x to skip, esc
* tabular: :Tab/=, = is the char to align

pro only:
* tagbar: TT
* YouCompleteMe: ,j to jump to def
