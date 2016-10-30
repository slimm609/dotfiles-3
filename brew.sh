#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install ZSH
brew install zsh

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

brew install git
brew install ack
brew install hub
brew install mackup
brew install reattach-to-user-namespace
brew install gpg
brew install git-extras
brew install diff-so-fancy

# Install Node.js and fix a common problem with Node's brew: https://gist.github.com/DanHerbert/9520689
brew install node --without-npm
echo prefix=~/.node >> ~/.npmrc
curl -L https://www.npmjs.com/install.sh | sh

# Install Python and Pip
brew install python
brew install pip

# Install phpbrew
brew install phpbrew

# Install applications through Brew cask
brew tap caskroom/versions
brew cask install spectacle
brew cask install flux
brew cask install google-drive
brew cask install spotify
brew install virtualbox
brew cask install atom
brew cask install vlc
brew cask install rescuetime
brew cask install duet
brew cask install the-unarchiver
brew cask install evernote
brew cask install alfred

# Remove outdated versions from the cellar.
brew cleanup
