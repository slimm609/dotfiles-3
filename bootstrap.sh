#!/usr/bin/env bash
git pull origin master;

# At some point should use the $ZDOTDIR variable, but apparently if this script is run with Bash the variable isn't set.
ZIMDIR="$HOME/.zsh/.zim"

# Copy the joey.zsh-theme to the $ZIMDIR/modules/prompt/functions folder so it can be used as a custom prompt
# File needs to be of the format prompt_*_setup.
cp joey.zsh-theme "$ZIMDIR/modules/prompt/functions/prompt_joey_setup"

if [ $? -eq 0 ]; then
  echo "Copied joey.zsh-theme to prompts folder"
fi

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
