.PHONY: all test clean

apt:
	sudo apt update
	sudo apt install --yes exuberant-ctags

brew:
	brew install ctags jq yq the_silver_searcher ripgrep hadolint checkmake shellcheck

pip:
	python3 -m pip install --user -Ur requirements.txt

plugins:
	./update-plugins.py
