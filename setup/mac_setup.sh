#!/bin/bash

# Author: Andrew Dean
# Description: This is a script meant for a clean install of macOS

# Upon completion, will reboot
# Should be run once with sudo privileges
# Can run multiple times without problems, if needed
# Remember to chmod +x
# This is the very first thing to be run on a clean install


# ----------------------------------------------------------------------------
# ORGANIZE LATER
#

# Disable automatically rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false

# Enable key repeats
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false