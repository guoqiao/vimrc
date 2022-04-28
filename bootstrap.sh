#!/bin/bash

sudo apt update
sudo apt install --yes exuberant-ctags
sudo python3 -m pip install -U pip jedi black
