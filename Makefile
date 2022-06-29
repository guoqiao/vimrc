apt:
	sudo apt update
	sudo apt install --yes exuberant-ctags

brew:
	brew install ctags

pip:
	python3 -m pip install --user -Ur requirements.txt

plugins:
	./update-plugins.py
