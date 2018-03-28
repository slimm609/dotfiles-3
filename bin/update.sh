#!/usr/bin/env bash
sudo softwareupdate -i -a

brew update
brew bundle --verbose

cat Npmfile | xargs npm i -g

# Update RVM
rvm get stable --ignore-dotfiles

Z_DIR=~/Development/Applications/z
echo "Updating Z"
git --git-dir=${Z_DIR}/.git --work-tree=$Z_DIR pull origin master

