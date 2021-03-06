.PHONY: install
install:
	# Install homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	# Install Zim
	curl -fsSL https://raw.githubusercontent.com/zimfw/install/develop/install.zsh | zsh
	# Get all of the submodules
	git submodule update --init --recursive
	# Create folder for development applications
	mkdir -p ~/Development/Applications
	# Clone the rupa/z application
	git clone git@github.com:rupa/z.git ~/Development/Applications/z
	# Install deps defined in Brewfile
	-brew update && brew bundle --verbose
	# Install all VIM plugins
	nvim +'PlugInstall --sync' +qall &> /dev/null
	# Install RVM
	gpg --keyserver hkp://ipv4.pool.sks-keyservers.net:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	curl -sSL https://get.rvm.io | bash -s stable --ruby --ignore-dotfiles
	# Install NVM
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
	# Setup version of Python
	pyenv install 3.7.4
	pyenv global 3.7.4
	# Install deps defined in Yarnfile
	cat Yarnfile | xargs yarn global add
	# Setup bat
	bat cache --build --source ~/.dotfiles/bat
	# Install settings sync plugin for VSCode
	# This will allow me to easily get all my settings for VSCode
	code --install-extension Shan.code-settings-sync
	# Symlink the dotfiles to home folder
	stow -vv home
	# Set default shell
	echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/zsh
	# Print bye-bye message
	$(info Done setting up your Mac :))
	$(info You should probably do the following things still: )
	$(info 		1. Run bootstrap task (Setup Full Disk Access for terminal though))
	$(info 		2. Setup a SSH key for GitHub: ssh-keygen -t rsa -C emailgoes@here.nl)
	$(info 		3. Setup a GPG key: gpg --full-generate-key)
	$(info    4. Authenticate with gcalcli by running: gcalcli list)
	$(info    5. Might want to install the go home script for a work laptop: make install install_gohome_script)
	$(info     6. Put laptop/user-specific Git config in ~/.gitconfig-user. For example GPG key)

install_gohome_script:
	pip install gcalcli
	cp login-calendar/com.joeykaan.gohome.plist ~/Library/LaunchAgents/
	launchctl load ~/Library/LaunchAgents/com.joeykaan.gohome.plist

uninstall_gohome_script:
	launchctl unload ~/Library/LaunchAgents/com.joeykaan.gohome.plist
	rm -rf ~/Library/LaunchAgents/com.joeykaan.gohome.plist

bootstrap:
	install/macos.sh

uninstall:
	# Set default shell to bash
	chsh -s /bin/bash
	# Unlink dotfiles
	-stow -vvD home
	# Uninstall Python version and default to system version
	pyenv uninstall -f 3.7.4
	pyenv global system
	# Uninstall deps defined in Yarnfile
	cat Yarnfile | xargs yarn global remove
	# Remove RVM
	-rvm implode --force
	# Remove NVM
	rm -rf ~/.nvm
	# Remove development applications folder
	rm -rf ~/Development/Applications
	# Remove zim
	rm -rf $ZDOTDIR/.zim
	# Uninstall homebrew
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall | ruby
