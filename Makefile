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

pip:
	python3 -m pip install --user -Ur requirements.txt

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
		yq || true

npm:
	which npm && npm install -g prettier || true

plugins:
	./update-plugins.py

all: apt pip brew npm plugins
