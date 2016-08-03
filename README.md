## clone this repo

    git clone https://github.com/guoqiao/vimx.git ~/.vim && cd ~/.vim

## install
Install dependencies:

- flake8 OR pylint was required by syntastic, install both here.
- ctags was required by tagbar
- silverseacher-ag was requrired by ctrlp

install python dependencies:

    sudo pip install -U flake8 pylint autopep8

install binary dependencies:

OS X:

    brew install ctags-exuberant the_silver_searcher

Ubuntu:

    sudo apt-get install exuberant-ctags silversearcher-ag cmake

Then install:

    ./install.sh

Install YouCompleteMe:
    cd bundle/YouCompleteMe
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

## Build latest vim
clipboard and python support are required in this config, to check your current vim:

    vim --version | grep clip
    vim --version | grep python

There should be a '+' sign before them. If not, build vim yourself:

    ./build-vim.sh

## Build latest ag|silver-searcher

    ./build-ag.sh
