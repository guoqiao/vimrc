#!/bin/bash
# for debian/ubuntu
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev

# for redhat/centos/fedora
# yum -y install pkgconfig automake gcc zlib-devel pcre-devel xz-devel

cd /tmp

if cd the_silver_searcher;
    then git pull;
    else git clone https://github.com/ggreer/the_silver_searcher.git && cd the_silver_searcher;
fi

./build.sh
sudo make install
