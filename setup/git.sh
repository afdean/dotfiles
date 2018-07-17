#!/bin/bash

# Author: Andrew Dean
# Description: Configures git settings

# ----------------------------------------------------------------------------
# Config
#

git config --global core.excludesfile ~/.gitignore
git config --global user.name "Andrew Dean"
git config --global core.editor vim
git config --global push.default upstream
git config --global merge.conflictstyle diff3
