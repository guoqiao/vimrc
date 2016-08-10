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

cd ~/.vim/bundle/YouCompleteMe/
git pull
git submodule update --init --recursive
bash install.sh
