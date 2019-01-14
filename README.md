# Background
I have used this repo for more than 5 years, as a Python developer, on both macOS and Linux.

## Principles:
- keep it lightweight and minimal, only use necessary config and plugins
- keep it general for both macOS and Linux
- keep it updated, never stop to absorb new ideas and tools
- keep it easy to use, use most reasonable and handy shortcuts

## Install

    git clone https://github.com/guoqiao/vimrc.git ~/.vim && cd ~/.vim

macOS:

    ./install-macos.sh

Ubuntu:

    ./install-ubuntu.sh

## Useful mapping
* leader key is `,`
* map `;` to `:`, so you don't need to press shift for `:` each time
* `0` to line begin, `<Space>` to line end

## The leader key
Leader key is `,` in this vimrc. Related shortcuts:
* remove search result highlight: [leader] + h
* search and replace text: visual select, then [leader] + r to replace
* YouCompleteMe: [leader] + j to jump to def
* YankRing: [leader] + p to open paste history, q to quit
* vim-easymotion: [leader][leader] + w
* edit vimrc: [leader] + ev
* NERD-Commenter: [leader] + ci or Ctrl + /

## Tabs
* tn: new tab
* tc: close tab
* th: move to left tab
* tl: move to right tab
* tm: move tab to last
* to: close other tab

## Window split
* move around splits: ctrl + [hjkl]

## plugin settings
* NERDTree: tt to toggle tree, ff to find file in tree(reveal)
* CtrlP: ctrl + p
* Emmet: ctrl + y + ,
* vim-indent-object: vii, via
* vim-multiple-cursors: ctrl + n for next, ctrl + b for prev, ctrl + x to skip, esc
* tabular: :Tab/=, = is the char to align
* tagbar: TT, show tags on right

## Tmux
This repo now also incldues a tmux.conf. It's based on the lastest tmux from github.
To build tmux and install it to `/usr/bin/`:

    bash scripts/build-tmux.sh

To install tmux.conf:

    ln -s ~/.vim/tmux.conf ~/.tmux.conf
    tmux kill-server

Basic usage:

- prefix: Ctrl + b (didn't change to Ctrl + a since that's a os level shortcuts to go to line begin)
- prefix + - and | to split window, easy to remember
- prefix + arrows to resize panes
- prefix + r to reload conf and display a "Reloaded" message, otherwise you need to `tmux kill-server`
- prefix + z to maximium current pane
- prefix + space to switch between builtin layouts
- Ctrl + arrows to move arround between panes, no prefix needed

## ag
The silversearcher-ag is a super fast command line search tool which I used for CtrlP.
You can also use it to replace `find`, `locate`, `ack` in terminal.

Basic usage:

- search text in dir: `ag TEXT`
- search file in dir: `ag -g NAME`
- search python files only: `ag --python TEXT`

## build latest vim
Note: now this will be done in the install script automcatically.
clipboard and python support are required in this config, to check your current vim:

    vim --version | grep clip
    vim --version | grep python

There should be a '+' sign before them. If not, build vim yourself:

    bash script/build-vim.sh

## Other tools

    bash script/build-ag.sh
    bash script/build-fish.sh
    bash script/build-tmux.sh

