#!/bin/bash
mkdir -p bundle
git clone https://github.com/gmarik/vundle.git bundle/vundle
ln -is ~/.vim/vimrc ~/.vimrc
vim +BundleInstall +qall
