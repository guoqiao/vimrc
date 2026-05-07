.PHONY: all test clean

apt:
	which apt && sudo apt update && sudo apt install --yes \
		git \
		tig \
		tree \
		jq \
		shellcheck \
		silversearcher-ag \
		exuberant-ctags \
		vim || true

pip:
	python3 -m pip install --user -Ur requirements.txt

brew:
	which brew && brew install \
		jq yq \
		ripgrep the_silver_searcher
		shellcheck \
		fd

npm:
	which npm && npm install -g prettier || true

plugins:
	./update-plugins.py

all: brew npm plugins
