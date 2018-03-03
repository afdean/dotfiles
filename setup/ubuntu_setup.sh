#!/bin/bash

# Author: Andrew Dean
# Description: This is a script meant for a clean install of ubuntu using GNOME 

# Upon completion, will reboot
# Should be run once with sudo privileges
# Remember to chmod +x

# ----------------------------------------------------------------------------
# Update and Upgrade 
#

apt update
apt -y upgrade
apt -y dist-upgrade
apt -y install snapd

# ----------------------------------------------------------------------------
# PPAs 
#

## Third Party
# Atom
add-apt-repository -y ppa:webupd8team/atom
# Mesa
add-apt-repository -y ppa:ubuntu-x-swat/updates
# Timeshift
apt-add-repository -y ppa:teejee2008/ppa
# Veracrypt
add-apt-repository -y ppa:unit193/encryption

## Official
# Brave
wget -qO - https://s3-us-west-2.amazonaws.com/brave-apt/keys.asc | sudo apt-key add -
add-apt-repository -y "deb [arch=amd64] https://s3-us-west-2.amazonaws.com/brave-apt xenial main"
# Spotify
sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# Cryptomator
add-apt-repository ppa:sebastian-stenzel/cryptomator

# Update all of the PPAs to be used
apt update

# ----------------------------------------------------------------------------
# Programming
#

# Using default openjdk for java
apt -y install python
apt -y install python3
apt -y install pip
apt -y install ant
apt -y install maven
pip install certifi
pip install scipy
pip install matplotlib
pip install numpy
pip install pandas
pip install pylint
pip install scikit-learn
pip install uncompyle2
pip install virtualenv
pip install django

# ----------------------------------------------------------------------------
# Software
#

apt -y install anki
apt -y install atom
apt -y install bleachbit
apt -y install blender
apt -y install brave
apt -y install calibre
apt -y install clonezilla
apt -y install cryptomator
apt -y install compizconfig-settings-manager
apt -y install darktable
apt -y install dnscrypt-proxy
apt -y install dolphin-emu
apt -y install nautilus-dropbox
apt -y install eclipse
apt -y install gnome-tweak-tool
apt -y install libffado2
apt -y install filezilla
apt -y install firefox
apt -y install git
apt -y install handbrake
apt -y install jackd
snap install keepassxc
apt -y install krita
apt -y install libreoffice
apt -y install lxrandr
apt -y install musescore
apt -y install octave
apt -y install openvpn
apt -y install playonlinux
apt -y install psensor
apt -y install puredata
apt -y install qbittorrent
apt -y install rkhunter
apt -y install spotify-client
apt -y install steam
apt -y install synaptic
apt -y install timeshift
apt -y install thunderbird
apt -y install torbrowser-launcher
apt -y install veracrypt
apt -y install virtualbox
apt -y install vlc
apt -y install wine

# ----------------------------------------------------------------------------
# Final

# Set wallpaper
gsettings set org.gnome.desktop.background picture-uri file:////~/docfiles/wallpaper/dual_wallpaper.jpg

# Final check to make sure all software is up to date
apt update
apt -y upgrade
apt -y dist-upgrade
apt -y autoremove
reboot

# ----------------------------------------------------------------------------
# Unfinished

# Enable Ubuntu universe ppa
# ?

# Use LXrandr to set up monitors correctly
# ?

# Add dotfiles/ubuntu_startup.sh to startup apps
# ?

# Timeshift backups
# ?

# Use custom about:config for firefox
# ?

# Tweak tool things
# ?

# Install GNOME extensions
# ?
#
