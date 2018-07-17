#!/bin/bash

# Author: Andrew Dean
# Description: Installs pip packages

# Not meant to be run directly, but through a setup script

# ----------------------------------------------------------------------------
# Update and Upgrade
#
pip install --upgrade

# ----------------------------------------------------------------------------
# Install Packages
#
packages="certifi Django matplotlib numpy pandas Pygments pylint scikit-learn
    scipy uncompyle2 virtualenv"

for pkg in $packages; do
    echo "Installing $pkg"
    yes | pip install $pkg
done

# ----------------------------------------------------------------------------
# Clean Up
#
pip install --upgrade
