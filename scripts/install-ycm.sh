#!/bin/bash

cd ~/.vim/bundle/YouCompleteMe/
git pull
git submodule update --init --recursive
python install.py
