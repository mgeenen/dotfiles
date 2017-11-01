#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install casks
brewdo brew cask install --appdir=/Applications firefox
brewdo brew cask install --appdir=/Applications telegram
brewdo brew cask install --appdir=/Applications google-chrome
brewdo brew cask install --appdir=/Applications filezilla
brewdo brew cask install --appdir=/Applications gimp
brewdo brew cask install --appdir=/Applications hex-fiend
brewdo brew cask install --appdir=/Applications libreoffice
brewdo brew cask install --appdir=/Applications sublime-text
brewdo brew cask install --appdir=/Applications disk-inventory-x
brewdo brew cask install --appdir=/Applications gpgtools
brewdo brew cask install --appdir=/Applications iterm2
brewdo brew cask install --appdir=/Applications tower
brewdo brew cask install --appdir=/Applications sqlitebrowser
brewdo brew cask install --appdir=/Applications postman
brewdo brew cask install --appdir=/Applications sequel-pro
brewdo brew cask install --appdir=/Applications the-unarchiver
brewdo brew cask install --appdir=/Applications virtualbox
brewdo brew cask install --appdir=/Applications virtualbox-extension-pack
brewdo brew cask install --appdir=/Applications vlc
brewdo brew cask install --appdir=/Applications spotify

# Quicklook plugins yeah
sudo chmod 775 /Library/QuickLook
# leider kaputt: brewdo brew cask install --qlplugindir=/Library/QuickLook/ qlcolorcode
brewdo brew cask install --qlplugindir=/Library/QuickLook/ qlstephen
brewdo brew cask install --qlplugindir=/Library/QuickLook/ qlmarkdown
brewdo brew cask install --qlplugindir=/Library/QuickLook/ quicklook-json
brewdo brew cask install --qlplugindir=/Library/QuickLook/ qlprettypatch
brewdo brew cask install --qlplugindir=/Library/QuickLook/ quicklook-csv
brewdo brew cask install --qlplugindir=/Library/QuickLook/ betterzipql
brewdo brew cask install --qlplugindir=/Library/QuickLook/ qlimagesize
qlmanage -r

# Install font
brewdo brew tap caskroom/fonts
#brewdo brew cask install --font-dir=/Library/Fonts font-hack

# Remove outdated versions from the cellar.
brewdo brew cleanup
brewdo brew cask cleanup
