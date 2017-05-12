#!/usr/bin/env bash
sudo softwareupdate -i -a

brew update
brew bundle

cat Yarnfile | xargs yarn global add

# This will install gems in the ruby gems folder
bundle install

# Update RVM
rvm get stable --ignore-dotfiles

# Update requirements
# -z option will return exit code 11 when packages have updates
pur -z -r requirements.txt
if [ $? -eq 11 ]; then
  pip install -r requirements.txt
fi

Z_DIR=~/Development/Applications/z
echo "Updating Z"
git --git-dir=${Z_DIR}/.git --work-tree=$Z_DIR pull origin master

