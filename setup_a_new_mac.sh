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
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
brew tap homebrew/versions

brew install bash-completion
brew install carthage
brew install clang-format
brew install coreutils
brew install docker
brew install docker-compose
brew install docker-machine
brew install docker-swarm
brew install doxygen
brew install findutils
brew install gnu-sed --with-default-names
brew install grep
brew install jq
brew install mariadb
brew install moreutils
brew install node4-lts --without-npm
brew install openssh
brew install openssl
brew install p7zip
brew install ssh-copy-id
brew install vegeta
brew install wget --with-iri

sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install casks
brew install caskroom/cask/brew-cask
brew cask install caskroom/versions/sublime-text3
brew cask install cocoapods
brew cask install disk-inventory-x
brew cask install dropbox
brew cask install google-chrome
brew cask install gpgtools
brew cask install iterm2
brew cask install java
brew cask install rescuetime
brew cask install sequel-pro
brew cask install telegram
brew cask install the-unarchiver
brew cask install tunnelblick
brew cask install virtualbox
brew cask install virtualbox-extension-pack

# Install fonts
brew tap caskroom/fonts
brew cask install font-hack

# setup node
# http://www.johnpapa.net/how-to-use-npm-global-without-sudo-on-osx/
mkdir ~/.npm_packages
curl -L https://www.npmjs.org/install.sh | sh

curl -L https://github.com/chrissimpkins/Hack/releases/download/v2.019/Hack-v2_019-ttf.tar.gz > ~/Downloads/Hack-v2_019-ttf.tar.gz
cd ~/Downloads/ && tar xfz Hack-v2_019-ttf.tar.gz &&

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
