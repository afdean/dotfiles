#!/bin/bash

# Author: Andrew Dean
# Description: Installs brew cask packages

# Notes:
# Not meant to be run directly, but through a setup script

###############################################################################
# UPDATE AND UPGRADE
###############################################################################

brew cask upgrade

###############################################################################
# INSTALL PACKAGES
###############################################################################

# NOT ON HERE:
# Logic
# Minilogue Sound Librarian
# OneNote
# Rewire
# Wunderlist


packages="
    ableton-live-standard
    anki
    brave-browser
    calibre
    cryptomator
    dnscrypt
    dropbox
    filezilla
    firefox
    handbrake
    ilok-license-manager
    iTerm2
    keepassxc
    libreoffice
    musescore
    native-access
    skype
    spotify
    the-unarchiver
    thunderbird
    visual-studio-code
    vlc
    waves-central
"

for pkg in $packages; do
    echo "Installing $pkg"
    yes | brew cask install $pkg
done

###############################################################################
# CLEANUP
###############################################################################

brew cask upgrade
brew cask cleanup
