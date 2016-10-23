#!/usr/bin/env bash

git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude ".gitmodules" \
		--exclude "README.md" --exclude "macos.sh" --exclude "LICENSE-MIT.txt" --exclude "bin/" --exclude "utils/" --exclude "install-zim.zsh" --exclude "install-deps.sh" --exclude "brew.sh"  -avh --no-perms . ~;
	source ~/.bash_profile;
}

echo "Make sure to run 'mackup backup' to restore all files from Dropbox (Dropbox/Mackup folder should be synced first)";
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
