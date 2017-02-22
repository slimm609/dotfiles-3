#!/usr/bin/env bash
git pull origin master;

# At some point should use the $ZDOTDIR variable, but apparently if this script is run with Bash the variable isn't set.
ZIMDIR="$HOME/.zsh/.zim"

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude ".gitmodules" \
		--exclude "README.md" --exclude "macos.sh" --exclude "LICENSE-MIT.txt" --exclude "bin/" --exclude "utils/" --exclude "install-zim.zsh" --exclude "install-deps.sh" --exclude "brew.sh"  -avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
elif [ "$1" == "--test" ]; then
  mkdir ~/dotfiles-test
  rsync -avh . ~/dotfiles-test
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
