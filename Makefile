.PHONY: install
install:
	# Install homebrew
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
	# Get all of the submodules
	git submodule update --init --recursive
	# Get all vim plugins
	vim +'PlugInstall --sync' +qall &> /dev/null
	# Setup all dependencies
	-install/install-deps.sh
	# Install deps defined in Brewfile
	-brew update && brew bundle --verbose
	# Install deps defined in Npmfile
	cat Npmfile | xargs npm i -g
	# Symlink the dotfiles to home folder
	stow -v home
	# Set default shell
	chsh -s /bin/zsh

bootstrap:
	install/macos.sh

uninstall:
# Remove RVM
	-rvm implode --force
	# Remove development applications folder
	rm -rf ~/Development/Applications
	# Unlink dotfiles
	-stow -vD home
	# Set default shell to bash
	chsh -s /bin/bash
	# Uninstall homebrew
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall | ruby
