.PHONY: install
install:
	# Install homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# Get all of the submodules
	git submodule update --init --recursive
	# Get all vim plugins
	vim +'PlugInstall --sync' +qall &> /dev/null
	# Setup all dependencies
	install/install-deps.sh
	# Install deps defined in Brewfile
	brew update && brew bundle --verbose
	# Install deps defined in Npmfile
	cat Npmfile | xargs npm i -g
	# Symlink the dotfiles to home folder
	stow home
	# Set default shell
	chsh -s /bin/zsh

bootstrap:
	install/macos.sh

uninstall:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
