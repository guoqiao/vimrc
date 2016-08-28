# Background
I have used this repo for more than 5 years, as a Python/Django developer, in both macOS and Ubuntu.

## Principles:
- keep it lightweight, only use necessary config and plugins
- keep it general for both macOS and Ubuntu
- keep it updated, never stop to absorb new ideas
- keep it easy to use, use best shortcuts

## Install

    git clone https://github.com/guoqiao/vimx.git ~/.vim && cd ~/.vim

macOS:

    ./install-macos.sh

Ubuntu:

    ./install-ubuntu.sh

This will also build the lastest vim and silversearcher-ag for you.

Note: silversearcher-ag is a super fast command line search tool which I used for CtrlP.
You can also use it to replace `find`, `locate`, `ack`, etc.

To search text in dir: `ag TEXT`
To search file in dir: `ag -g NAME`

## Useful mapping
* leader key is `,`
* map ; to :, so you don't need to press shift for : each time
* 0 line begin, [space] to end

## The leader key
Leader key is `,` in this vimrc. Related shortcuts:
* remove search result highlight: [leader]h
* search and replace text: visual select, then [leader]r to replace
* YouCompleteMe: [leader]j to jump to def
* YankRing: [leader]p to open paste history, q to quit
* vim-easymotion: [leader][leader]w
* edit vimrc: [leader]ev
* NERD-Commenter: [leader]ci

## Tabs
* tn: new tab
* tc: close tab
* th: move to left tab
* tl: move to right tab
* tm: move tab to last
* to: close other tab

## Window split
* windows: ctrl + [hjkl]

## plugin settings
* NERDTree: tt to toggle tree, ff to find file in tree(reveal)
* CtrlP: ctrl + p
* Emmet: ctrl + y + ,
* vim-indent-object: vii, via
* vim-multiple-cursors: ctrl + n for next, ctrl + b for prev, ctrl + x to skip, esc
* tabular: :Tab/=, = is the char to align
* tagbar: TT, show tags on right

## build latest vim and ag
Note: now this will be done in the install script automcatically.
clipboard and python support are required in this config, to check your current vim:

    vim --version | grep clip
    vim --version | grep python

There should be a '+' sign before them. If not, build vim yourself:

    bash script/build-vim.sh

## build latest silversearcher-ag

    bash script/build-ag.sh
