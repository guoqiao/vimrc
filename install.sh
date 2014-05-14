#!/bin/bash
mkdir -p bundle
git clone https://github.com/gmarik/vundle.git bundle/vundle
ln -is ~/.vim/vimrc ~/.vimrc
ln -is ~/.vim/vimrc ~/.gvimrc
ln -is ~/.vim/vimrc ~/.nvimrc
ln -is ~/.nvim ~/.vim
vim +BundleInstall +qall
