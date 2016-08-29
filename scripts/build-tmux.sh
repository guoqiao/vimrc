#!/bin/bash

cd /tmp

if cd tmux;
    then git pull;
    else git clone https://github.com/tmux/tmux.git && cd tmux;
fi

bash autogen.sh
./configure --prefix=/usr/
make
sudo make install
