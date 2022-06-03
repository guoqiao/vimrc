# guoqiao's vimrc

I work as Python Dev and DevOps for 10+ years.
Vim is my main editor, this repo is the configuration for it, works on both Ubuntu and macOS.

## Quick Start

On Ubuntu or macOS:
```
git clone https://github.com/guoqiao/vimrc.git ~/.vim
cd ~/.vim
./bootstrap.sh  # install deps via brew or apt
./update-plugins.py  # clone or update all plugin repos into pack/
```

Later, if you want to update plugins, just run:

```
./update-plugins.py
```

## Principles:
- keep it lightweight and minimal, only use necessary config and plugins
- keep it general for both macOS and Ubuntu
- keep it updated, never stop to absorb new ideas and tools
- keep it easy to use, use most reasonable and handy shortcuts

## Useful mapping
* map `;` to `:`, so you don't need to press shift for `:` each time
* `0` to line begin, `<Space>` to line end

## The leader key
Leader key is `,` in this vimrc. Related shortcuts:
* remove search result highlight: [leader] + h
* search and replace text: visual select, then [leader] + r to replace
* vim-easymotion: [leader][leader] + w
* edit vimrc: [leader] + ev
* NERD-Commenter: [leader] + ci or ctrl + /
* open current repo line(s) in github/gitlab/bitbucket: `[leader] + gh`

## Tabs
* tn: new tab
* tc: close tab
* to: keep only current tab/close all other tabs
* th: move to left tab
* tl: move to right tab
* tm: move tab to last

## Window split
* open split in NerdTree with `s` or `i` on file.
* move around splits: ctrl + ww, or ctrl + [hjkl]

## plugin settings
* NERDTree: `tt` to toggle tree, `ff` to find file in tree(reveal), `m + [acd]` to add/copy/delete file on tree
* tagbar: `TT`, toggle tags
* CtrlP: Ctrl + p, search files
* Emmet: Ctrl + y + , expand emmet to html
* vim-indent-object: vii, select text in current indent level
* vim-multiple-cursors: ctrl + n for next, ctrl + b for prev, ctrl + x to skip, esc
* tabular: :Tab/=, = is the char to align
* rm trailing whitespaces: `:FixWhitespace`
