#!/bin/bash

# Author: Andrew Dean (borrowed and edited)
# Description: Creates symlinks from ~ to dotfiles

###############################################################################
# VARIABLES
###############################################################################

dir=~/dotfiles
# Backup dir
olddir=~/dotfiles_old
files="bash_profile bashrc editorconfig gitignore vimrc vim"

###############################################################################
# SCRIPT
###############################################################################

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Move any existing dotfiles in homedir to dotfiles_old directory
# Then create symlinks 
for file in $files; do
    echo "Moving $file from ~ to $olddir if it exists"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -ns $dir/$file ~/.$file
done
