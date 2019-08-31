#!/usr/bin/env bash
sudo softwareupdate -i -a

brew update
brew bundle --verbose

cat Yarnfile | xargs yarn global add

pip install -r requirements.txt

# Update RVM
rvm get stable --ignore-dotfiles

Z_DIR=~/Development/Applications/z
echo "Updating Z"
git --git-dir=${Z_DIR}/.git --work-tree=$Z_DIR pull origin master

