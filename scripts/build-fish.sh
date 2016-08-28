#!/bin/bash

cd /tmp

if cd fish-shell;
    then git pull;
    else git clone https://github.com/fish-shell/fish-shell.git && cd fish-shell;
fi

autoconf
./configure
make
sudo make install
