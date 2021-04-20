#!/bin/bash

sudo apt update
sudo apt upgrade --yes
sudo apt install --yes exuberant-ctags
sudo python3 -m pip install -U jedi
