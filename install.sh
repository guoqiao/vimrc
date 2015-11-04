#!/bin/bash
cd ~/.vim
git pull
mkdir -p ~/.vim/bundle
if cd ~/.vim/bundle/Vundle.vim/;
    then git pull;
    else git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi
vim +PluginClean +qall
vim +PluginInstall +qall
