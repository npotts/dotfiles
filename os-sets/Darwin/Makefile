all: 

.PHONY: homebrew
homebrew:
	brew --version &> /dev/null || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

.PHONY: rz
rz: homebrew
	brew bundle --file rz/Brewfile install

