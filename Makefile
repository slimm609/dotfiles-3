.PHONY: install
install:
	git submodule update --init --recursive
	vim +'PlugInstall --sync' +qall &> /dev/null
