#!/bin/sh

# try to install deps with homebrew/linuxbrew first
if which brew; then
    echo "installing deps with brew ..."
    brew install ctags
else
    echo "installing deps with apt ..."
    sudo apt update && sudo apt install --yes exuberant-ctags
fi

sudo python3 -m pip install -U pip jedi black
