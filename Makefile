.PHONY: all test clean

apt:
	sudo apt update
	sudo apt install --yes exuberant-ctags

brew:
	brew install \
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

plugins:
	./update-plugins.py
