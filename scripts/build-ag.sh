#!/bin/bash

cd /tmp

if cd the_silver_searcher;
    then git pull;
    else git clone https://github.com/ggreer/the_silver_searcher.git && cd the_silver_searcher;
fi

./build.sh
sudo make install
