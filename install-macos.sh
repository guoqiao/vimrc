#!/bin/bash

set -x

# macOS only
brew update
brew install ctags-exuberant the_silver_searcher

bash scripts/install-common.sh
