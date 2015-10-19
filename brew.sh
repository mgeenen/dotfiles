#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install more recent versions of some OS X tools.
brew install bash
echo "/usr/local/bin/bash" >> /etc/shells
chsh -s /usr/local/bin/bash
brew tap homebrew/versions
brew install bash-completion2
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names
brew install docker
brew install docker-compose
brew install docker-machine
brew install mariadb
brew install openssh
brew install ssh-copy-id
brew install node
brew install openssl
brew install qt5
brew install wget --with-iri
brew install openssh
brew install p7zip

# Install casks
brew install caskroom/cask/brew-cask
brew cask install chitchat
brew cask install dropbox
brew cask install google-chrome
brew cask install gpgtools
brew cask install iterm2
brew cask install java
brew cask install qt-creator
brew cask install sequel-pro
brew cask install sublime-text3
brew cask install the-unarchiver
brew cask install tunnelblick
brew cask install virtualbox

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
