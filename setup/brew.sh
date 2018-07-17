#!/bin/bash

# Author: Andrew Dean
# Description: This is a script meant for a clean mac install to get brew packages

# Not meant to be run directly, but through a setup script

# ----------------------------------------------------------------------------
# Update and Upgrade
#
brew update
brew upgrade

# ----------------------------------------------------------------------------
# Install Packages
#

packages="ant ctags gcc ghostscript maven octave python python3 ruby texinfo
    tidy-html5"

brew install vim --with-override-system-vi

for pkg in $packages; do
    echo "Installing $pkg"
    brew install -y $pkg
done

# ----------------------------------------------------------------------------
# Handle Certain Packages
#
brew link python

# ----------------------------------------------------------------------------
# Clean Up
#
brew update
brew upgrade
