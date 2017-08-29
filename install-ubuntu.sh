#!/bin/bash
set -x

# Ubuntu only
sudo apt-get update
sudo apt-get install -y \
autoconf \
automake \
autotools-dev \
bc \
build-essential \
cmake \
exuberant-ctags \
gettext \
libatk1.0-dev \
libbonoboui2-dev \
libcairo2-dev \
libevent-dev \
libgnome2-dev \
libgnomeui-dev \
libgtk2.0-dev \
liblzma-dev \
libncurses5-dev \
libncurses5-dev \
libpcre3-dev \
libx11-dev \
libxpm-dev \
libxt-dev \
ncurses-dev \
pkg-config \
python-dev \
ruby-dev \
silversearcher-ag \
tmux \
zlib1g-dev \
vim-gtk \
vim-gnome \
git
sudo apt-get autoremove
sudo apt-get clean

gem install tmuxinator

bash scripts/install-common.sh
