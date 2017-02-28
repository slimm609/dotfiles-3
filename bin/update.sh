#!/usr/bin/env bash
sudo softwareupdate -i -a
brew bundle --file=../Brewfile
npm install npm -g
npm update -g
gem update --system
gem update
rvm get stable --ignore-dotfiles

Z_DIR=~/Development/Applications/z
echo "Updating Z"
git --git-dir=${Z_DIR}/.git --work-tree=$Z_DIR pull origin master

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ZIM_DIR=${SCRIPT_DIR}/../home/.zsh/.zim
echo "Updating Zim"
git --git-dir=${ZIM_DIR}/.git --work-tree=$ZIM_DIR pull origin master
