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
    anki
    brave-browser
    calibre
    cryptomator
    dnscrypt
    dropbox
    filezilla
    firefox
    handbrake
    iTerm2
    joplin
    keepassxc
    libreoffice
    musescore
    native-access
    signal
    skype
    spotify
    steam
    the-unarchiver
    thunderbird
    virtualbox
    vlc
    vscodium
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
