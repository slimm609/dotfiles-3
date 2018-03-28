.PHONY: install
install:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	git submodule update --init --recursive
	vim +'PlugInstall --sync' +qall &> /dev/null

uninstall:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
