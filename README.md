# guoqiao's vimrc

update 20200403:
this repo now aims to use vim without plugins, so you can copy vimrc to any server and start work there.
although vim plugins can still be added on top with: https://github.com/guoqiao/vim-pack-devpy

## Background
I have used this repo for more than 8 years, as a Python developer, on both macOS and Ubuntu.

## Principles:
- keep it lightweight and minimal, only use necessary config and plugins
- keep it general for both macOS and Ubuntu
- keep it updated, never stop to absorb new ideas and tools
- keep it easy to use, use most reasonable and handy shortcuts

## Install

    git clone https://github.com/guoqiao/vimrc.git ~/.vim && cd ~/.vim

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
