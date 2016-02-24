#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install node
# http://www.johnpapa.net/how-to-use-npm-global-without-sudo-on-osx/
brewdo brew install homebrew/versions/node4-lts --without-npm
mkdir ~/.npm_packages
curl -L https://www.npmjs.org/install.sh | sh

# Remove outdated versions from the cellar.
brewdo brew cleanup
brewdo brew cask cleanup

npm install --global npm
npm install --global jshint
npm install --global nodemon
npm install --global node-inspector
