#!/bin/bash

set -ue

DIR=~/.vim

if [ ! -d $DIR ]
then
    git clone https://github.com/guoqiao/vimrc.git $DIR
    cd $DIR
    make all
    cd ~
    if [ ! -f .gitconfig ]
    then
        echo "create symlink for ~/.gitconfig, please change email and user info"
        ln -s .vim/gitconfig .gitconfig
    fi
fi
