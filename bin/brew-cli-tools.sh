#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install more recent versions of some OS X tools.

brewdo brew install bash
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells > /dev/null
chsh -s /usr/local/bin/bash

brewdo brew install bash-completion
brewdo brew install carthage
brewdo brew install clang-format
brewdo brew install coreutils
brewdo brew install docker
brewdo brew install docker-machine
brewdo brew install docker-compose
brewdo brew install docker-swarm
brewdo brew install doxygen
brewdo brew install findutils
brewdo brew install gnu-sed --with-default-names
brewdo brew install jq
brewdo brew install openssl
brewdo brew install mariadb
brewdo brew install moreutils
brewdo brew install p7zip
brewdo brew install ssh-copy-id
brewdo brew install vegeta
brewdo brew install curl
brewdo brew install wget
brewdo brew install openssh
brewdo brew install git
brewdo brew install grep
brewdo brew install tree

# Remove outdated versions from the cellar.
brewdo brew cleanup

# enable `locate`
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
