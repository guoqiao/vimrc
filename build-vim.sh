#!/bin/bash
# for debian/ubuntu
sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev git

# for redhat/centos/fedora
# sudo yum install -y ruby ruby-devel lua lua-devel luajit \
    # luajit-devel ctags git python python-devel \
    # python3 python3-devel tcl-devel \
    # perl perl-devel perl-ExtUtils-ParseXS \
    # perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
    # perl-ExtUtils-Embed
# sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp 

cd /tmp

if cd vim;
    then git pull;
    else git clone https://github.com/vim/vim.git && cd vim;
fi

./configure --with-features=huge \
            --enable-pythoninterp \
            --enable-rubyinterp \
            --enable-python3interp

make
sudo make install
