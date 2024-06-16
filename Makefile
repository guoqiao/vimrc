.PHONY: all test clean

apt:
	sudo apt update
	sudo apt install --yes \
		git \
		tig \
		tree \
		jq \
		shellcheck \
		silversearcher-ag \
		exuberant-ctags \
		vim

brew:
	which brew && brew install \
		actionlint \
		checkmake \
		ctags \
		hadolint \
		jq \
		ripgrep \
		shellcheck \
		the_silver_searcher \
		yq

pip:
	python3 -m pip install --user -Ur requirements.txt

npm:
	npm install -g prettier

plugins:
	./update-plugins.py

all: apt brew pip plugins
