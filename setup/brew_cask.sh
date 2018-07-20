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

packages="
    ableton-live-standard
    android-studio
    anki
    atom
    battle-net
    blender
    brave
    calibre
    cryptomator
    darktable
    discord
    dnscrypt
    dolphin
    dropbox
    duet
    eclipse-ide
    filezilla
    firefox
    flux
    gog-galaxy
    handbrake
    hydrogen
    ilok-license-manager
    iTerm2
    keepassxc
    kindle
    krita
    libreoffice
    musescore
    qbittorrent
    rstudio
    skype
    soundflower
    spotify
    steam
    the-unarchiver
    thunderbird
    torbrowser
    unity
    vagrant
    veracrypt
    vlc
    waves-centra
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
