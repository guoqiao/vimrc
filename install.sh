#!/bin/bash

set -ue

DIR=~/.vim

if [ ! -d $DIR ]
then
    git clone https://github.com/guoqiao/vimrc.git $DIR
    cd $DIR
    make all
fi
