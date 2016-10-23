sudo softwareupdate -i -a
brew update
brew unlink php56
brew unlink php70
brew upgrade
brew link php70
brew cleanup
npm install npm -g
npm update -g
gem update --system
gem update

Z_DIR=~/Development/Applications/z
git --git-dir=${Z_DIR}/.git --work-tree=$Z_DIR pull
