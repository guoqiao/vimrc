#!/bin/bash

sudo apt-get install build-essential ncurses-dev libncurses5-dev gettext autoconf

cd /tmp

if cd fish-shell;
    then git pull;
    else git clone https://github.com/fish-shell/fish-shell.git && cd fish-shell;
fi

autoconf
./configure
make
sudo make install
