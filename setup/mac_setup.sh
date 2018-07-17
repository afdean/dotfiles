#!/bin/bash

# Author: Andrew Dean
# Description: This is a script meant for a clean install of macOS

# Upon completion, will reboot
# Should be run once with sudo privileges
# Can run multiple times without problems, if needed
# Remember to chmod +x

# ----------------------------------------------------------------------------
# Hardware and Functionality
#

# Enable tap click
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable automatically rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false

# Enable key repeats
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# ----------------------------------------------------------------------------
# Software
#

# Install xcode
xcode-select --install

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew Installs
sh ./brew.sh

# Pip installs
sh ./pip.sh

# Git settings
sh ./git.sh

# Reboot for changes
reboot

# ----------------------------------------------------------------------------
# Manually
#

# Switch caps and ctrl modifier key
