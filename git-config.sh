#!/bin/bash

git config --global color.ui true
git config --global push.default simple

git config --global branch.autosetuprebase always  # git pull --rebase every time

git config --global core.editor vim
git config --global core.pager less
git config --global core.autocrlf input  # use true on windows
git config --global core.compression 9  # 0: raw, 1: fastest, 9: smallest -1: let zlib decide

git config --global alias.br branch
git config --global alias.bl 'branch -l'
git config --global alias.bd 'branch -d'
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.ca 'commit --amend'
git config --global alias.cl 'config --list'
git config --global alias.di diff
git config --global alias.st status
git config --global alias.fa 'fetch --all'
git config --global alias.rb 'rebase -i origin/master'
git config --global alias.rd 'push origin --delete'
git config --global alias.li 'ls-files --other --ignored --exclude-standard  # list ignored files'
git config --global alias.ll 'log --pretty=format:"%C(yellow)%h %C(green)%ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=short --graph'
git config --global alias.ls 'log --pretty=format:"%C(green)%h %C(yellow)[%ad]%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=relative'
git config --global alias.ld 'log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate --numstat'
