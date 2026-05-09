.PHONY: all brew pip plugins

pip:
	python3 -m pip install --user -Ur requirements.txt

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

all: brew pip plugins
