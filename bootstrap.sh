#!/usr/bin/env bash

git pull origin master;

git submodule foreach git pull origin master;

# Create zsh_completions folder and add the hub.zsh_completions to it
mkdir -p $HOME/.zsh_completions
curl https://github.com/github/hub/blob/master/etc/hub.zsh_completion >  ~/.zsh_completions/_hub;

# Download imgcat folder, give it the right permissions and put it in the correct folder
wget -q --show-progress https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat;
chmod +x imgcat;
mkdir -p ${HOME}/bin && cp imgcat ${HOME}/bin/imgcat;
rm -rf imgcat;

# Copy TermPDF to ~/bin folder
cp utils/termpdf/termpdf ${HOME}/bin/termpdf;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude ".gitmodules" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude "utils/" --exclude "install-prezto.zsh" --exclude "install-deps.sh" --exclude "brew.sh"  -avh --no-perms . ~;
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
