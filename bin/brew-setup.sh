#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install brewdo
sudo ./brewdo/brewdo install
sudo ./brewdo/brewdo do make install
# add _homebrew to sudoers, so that some casks can be installed, which need sudo
echo '_homebrew ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers > /dev/null
# add _homebrew user do wheel and admin groups, so that cask can install/link to /Applications
sudo dseditgroup -o edit -a _homebrew -t user wheel
sudo dseditgroup -o edit -a _homebrew -t user admin
# fix caskroom permissions
sudo mkdir -P /opt/homebrew-cask
sudo chown -R _homebrew /opt/homebrew-cask

# Remove outdated versions from the cellar.
brewdo brew cleanup
brewdo brew cask cleanup

