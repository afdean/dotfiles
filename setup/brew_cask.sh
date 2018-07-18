#!/bin/bash

# Author: Andrew Dean
# Description: Installs brew cask packages

# Not meant to be run directly, but through a setup script

# ----------------------------------------------------------------------------
# Update and Upgrade
#
brew cask upgrade

# ----------------------------------------------------------------------------
# Install Packages
#

packages="ableton-live-standard android-studio anki atom battle-net blender
    brave calibre cryptomator darktable discord dnscrypt dolphin dropbox duet
    eclipse-ide filezilla firefox flux gog-galaxy handbrake hydrogen
    ilok-license-manager iTerm2 keepassxc kindle krita libreoffice musescore
    qbittorrent rstudio skype soundflower spotify steam thunderbird torbrowser
    unity vagrant veracrypt vlc waves-central"

for pkg in $packages; do
    echo "Installing $pkg"
    yes | brew cask install $pkg
done

# ----------------------------------------------------------------------------
# Clean Up
#
brew cask upgrade
brew cask cleanup