#!/bin/bash

sudo apt update
sudo apt upgrade --yes
sudo apt install --yes exuberant-ctags fontconfig
sudo python3 -m pip install -U jedi black
# for user only: ~/.local/share/fonts/
sudo cp -rfuv fonts/* /usr/local/share/fonts/
# list all fonts: fc-list
sudo fc-cache -fv
