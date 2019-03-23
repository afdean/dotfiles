#!/bin/bash

# Author: Andrew Dean
# Description: Sets up clean install of ubuntu using GNOME

# Notes:
# Upon completion, will reboot
# Should be run once with sudo privileges
# Can run multiple times without problems, if needed
# Remember to chmod +x
# This is the very first thing to be run on a clean install
# If problems with dependencies, run apt-get -f remove

###############################################################################
# UPDATE AND UPGRADE
###############################################################################

apt update
apt -y upgrade
apt -y dist-upgrade

###############################################################################
# PPAs
###############################################################################

repos="
    ppa:sebastian-stenzel/cryptomator
"

for repo in $repos; do
    echo "Adding $repo"
    add-apt-repository -y $pkg
done

# Signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# Lutris
ver=$(lsb_release -sr); if [ $ver != "18.10" -a $ver != "18.04" -a $ver != "16.04" ]; then ver=18.04; fi
echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
wget -q https://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add -

# Update all of the PPAs to be used
apt update

###############################################################################
# PROGRAMMING
###############################################################################

coding_pkg="
    ant
    git
    maven
    python
    python3
    pip
"

# Using default openjdk for java
for pkg in $coding_pkg; do
    echo "Installing $pkg"
    apt -y install $pkg
done

apt -y install r-base r-base-dev

# Pip installs
sh ./pip.sh

# Git settings
sh ./git.sh

###############################################################################
# SOFTWARE
###############################################################################

apt_software="
    anki
    ardour
    atom
    blender
    calibre
    clonezilla
    compizconfig-settings-manager
    cryptomator
    ctags
    dnscrypt-proxy
    dolphin-emu
    eclipse
    exuberent-ctags
    gnome-tweak-tool
    filezilla
    firefox
    libreoffice
    lutris
    mesa-vulkan-drivers
    nautilus-dropbox
    octave
    openvpn
    playonlinux
    psensor
    puredata
    qbittorrent
    signal-desktop
    steam
    synaptic
    thunderbird
    timeshift
    torbrowser-launcher
    vagrant
    veracrypt
    vim
    virtualbox
    vlc
    wine
"

snap_software="
    brave
    keepassxc
    musescore
    spotify
"

for soft in $apt_software; do
    echo "Installing $soft"
    apt -y install $soft
done

for soft in $snap_software; do
    echo "Installing $soft"
    yes | snap install $soft
done

# Downloads: vscode

###############################################################################
# UBUNTU STUDIO
###############################################################################

# Sets Ubuntu up to handle audio work
# Info pulled from https://help.ubuntu.com/community/UbuntuStudioPreparation
# Be aware, info might be outdated
# This is all fairly unnecessary when installing ardour

# studio_software="
#     jackd
#     libffado2
#     linux-lowlatency
#     qjackctl
# "

# for soft in $studio_software; do
#     echo "Installing $soft"
#     apt -y install $soft
# done

# ## Firewire setup
# adduser $USER audio
# firewire_software="
#     ffado-mixer-qt4
#     jackd2-firewire
#     pulseaudio-module-jack
#     patchage
# "

# for soft in $firewire_software; do
#     echo "Installing $soft"
#     apt -y install $soft
# done

###############################################################################
# RESTRICTED EXTRAS
###############################################################################

# Based upon 18.04(bionic) package except without flash
# https://packages.ubuntu.com/en/bionic/ubuntu-restricted-extras
# Will need to be updated for future versions

restrict_software="
    libavcodec-extra
    gstreamer1.0-fluendo-mp3
    gstreamer1.0-libav
    gstreamer1.0-plugins-ugly
    gstreamer1.0-vaapi
    ttf-mscorefonts-installer unrar
"

for soft in $firewire_software; do
    echo "Installing $soft"
    apt -y install $soft
done

###############################################################################
# CLEANUP
###############################################################################

# Set wallpaper
#gsettings set org.gnome.desktop.background picture-uri file:////~/docfiles/wallpaper/dual_wallpaper.jpg

# Final check to make sure all software is up to date
apt update
apt -y upgrade
apt -y dist-upgrade
apt -y autoremove
reboot
