#!/bin/bash

# Author: Andrew Dean
# Description: Installs brew packages

# Notes:
# Not meant to be run directly, but through a setup script

###############################################################################
# UPDATE AND UPGRADE
###############################################################################

brew update
brew upgrade

###############################################################################
# INSTALL PACKAGES
###############################################################################

packages="
    ant
    bash-completion2
    cmake
    coreutils
    ctags
    gcc
    ghostscript
    maven
    octave
    python
    python3
    ruby
    texinfo
"

brew install vim --with-override-system-vi

for pkg in $packages; do
    echo "Installing $pkg"
    brew install -y $pkg
done

###############################################################################
# HANDLE CERTAIN PACKAGES
###############################################################################

brew link python

###############################################################################
# CLEANUP
###############################################################################

brew update
brew upgrade
brew cleanup
brew analytics off
