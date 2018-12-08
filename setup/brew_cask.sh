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

# Available, but currently choosing not to have under standard install
# ableton-live-standard
# android-studio
# atom
# battle-net
# blender
# darktable
# discord
# dnscrypt
# dolphin
# duet
# flux
# gog-galaxy
# handbrake
# hydrogen
# ilok-license-manager
# kindle
# krita
# qbittorrent
# rstudio
# soundflower
# steam
# torbrowser
# unity
# vagrant
# veracrypt
# waves-central

packages="
    anki
    brave-browser
    calibre
    cryptomator
    dropbox
    eclipse-ide
    filezilla
    firefox
    iTerm2
    keepassxc
    libreoffice
    musescore
    skype
    spotify
    the-unarchiver
    thunderbird
    visual-studio-code
    vlc
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
