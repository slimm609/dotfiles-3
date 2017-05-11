#!/usr/bin/env bash
sudo softwareupdate -i -a
brew update
brew bundle
npm install npm -g
npm update -g
gem update --system
gem update
rvm get stable --ignore-dotfiles

Z_DIR=~/Development/Applications/z
echo "Updating Z"
git --git-dir=${Z_DIR}/.git --work-tree=$Z_DIR pull origin master

