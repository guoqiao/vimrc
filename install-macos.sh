#!/bin/bash

set -x

# macOS only
brew update
brew upgrade
brew install vim fish tmux zsh zsh-completions ctags-exuberant the_silver_searcher reattach-to-user-namespace

brew unlink tmux && brew link tmux
brew unlink zsh && brew link zsh
brew unlink vim && brew link vim

bash scripts/install-common.sh
