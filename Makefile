.PHONY: all brew plugins

brew:
	brew install \
		vim \
		git \
		python \
		actionlint \
		checkmake \
		fd \
		hadolint \
		prettier \
		shellcheck \
		universal-ctags

plugins:
	./update-plugins.py

all: brew plugins
