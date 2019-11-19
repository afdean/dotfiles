#!/bin/bash

# Author: Andrew Dean
# Description: Sets up clean mac install

# Notes:
# Upon completion, will reboot
# Should be run once
# Can run multiple times without problems, if needed
# Remember to chmod +x
# Need to easy_install pip and run pip.sh separately
# This is the very first thing to be run on a clean install

###############################################################################
# HARDWARE AND FUNCTIONALITY
###############################################################################

# Use "defaults read > defaults.txt" in order to find most of these
# Can check for new ones by using a diff before and after changes

### Trackpad
### This broke under Mojave
## Right click behavior
#defaults write "Apple Global Domain" ContextMenuGesture 1
## Swipe direction behavior ("unnatural")
#defaults write "Apple Global Domain" com.apple.swipescrolldirection 0
## Clicking and draglock (from accessibility settings)
#defaults write com.apple.AppleMultitouchTrackpad Clicking 1
#defaults write com.apple.AppleMultitouchTrackpad DragLock 1
#defaults write com.apple.AppleMultitouchTrackpad Dragging 1
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking 1
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock 1
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging 1
## Enable required gestures
#defaults write com.apple.dock showAppExposeGestureEnabled 1
#defaults write com.apple.dock showDesktopGestureEnabled 1
#defaults write com.apple.dock showLaunchpadGestureEnabled 1
#defaults write com.apple.dock showMissionControlGestureEnabled 1
## 4/5 finger launchpad
#defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture 2
#defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture 2
## 4 finger horizontal swipe between screens
#defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture 2
## 3/4 finger vertical swipe mission control and app expose
#defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture 2
#defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture 2
## 3 finger horizontal page swipe
#defaults write "Apple Global Domain" AppleEnableSwipeNavigateWithScrolls 0
#defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture 1
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture 1
## 2 finger right click
#defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick 1
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick 1
## 2 finger notification center
#defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture 3
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture 3

### Keyboard
# Enable key repeats
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

### Finder
# Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: icnv, clmv, Flwv"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

### Functionality
# Disable automatically rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false
# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true
# Set dock on left side
defaults write com.apple.dock orientation left
# Set dock size
# defaults write com.apple.dock tilesize 40
# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

### Privacy
# Don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

###############################################################################
# SOFTWARE
###############################################################################

# Install xcode cli tools
xcode-select --install

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew Installs
sh ./brew.sh

# Pip installs
# sh ./pip.sh

# Git settings
sh ./git.sh

# Brew Cask installs
sh ./brew_cask.sh

# Reboot for changes
reboot

###############################################################################
# MANUALLY (can't automate easily or at all)
###############################################################################

# Switch caps and ctrl modifier key
# Disable automatic login and user lists
# Disable password hints
# Disable guest account and sharing
# Require password immediately after sleep/screensaver
# Firewall on
# All analytics off (share mac, share with app dev, etc)
# Firevault on
# Disable all spotlight searching
# Always show scoll bars
