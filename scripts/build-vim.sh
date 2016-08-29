#!/bin/bash

cd /tmp

if cd vim;
    then git pull;
    else git clone https://github.com/vim/vim.git && cd vim;
fi

./configure --prefix=/usr/ \
            --with-features=huge \
            --enable-pythoninterp \
            --enable-rubyinterp \
            --enable-python3interp

make
sudo make install
