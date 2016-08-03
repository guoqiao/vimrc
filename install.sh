#!/bin/bash
cd ~/.vim

git pull

sudo pip install -r requirements.txt

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

if cd Vundle.vim;
    then git pull;
    else git clone https://github.com/VundleVim/Vundle.vim.git;
fi

cd ~/.vim

vim +PluginClean +qall
vim +PluginInstall +qall

~/.vim/bundle/YouCompleteMe/install.sh
