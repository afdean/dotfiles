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
apt -y install snapd

###############################################################################
# PPAs
###############################################################################

repos="
    ppa:maarten-fonville/android-studio
    ppa:webupd8team/atom
    ppa:teejee2008/ppa
    ppa:sebastian-stenzel/cryptomator
"

for repo in $repos; do
    echo "Adding $repo"
    add-apt-repository -y $pkg
done

# Lutris
ver=$(lsb_release -sr); if [ $ver != "17.10" -a $ver != "17.04" -a $ver != "16.04" ]; then ver=16.04; fi
echo "deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
wget -q http://download.opensuse.org/repositories/home:/strycore/xUbuntu_$ver/Release.key -O- | sudo apt-key add -

# Brave
wget -qO - https://s3-us-west-2.amazonaws.com/brave-apt/keys.asc | sudo apt-key add -
add-apt-repository -y "deb [arch=amd64] https://s3-us-west-2.amazonaws.com/brave-apt xenial main"

# Spotify
sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

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
    android-studio
    anki
    ardour
    atom
    audacity
    bleachbit
    blender
    brave
    calibre
    clonezilla
    cryptomator
    compizconfig-settings-manager
    ctags
    darktable
    dnscrypt-proxy
    dolphin-emu eclipse
    exuberent-ctags
    gnome-tweak-tool
    filezilla
    firefox
    handbrake
    krita
    libreoffice
    lutris
    lxrandr
    musescore
    nautilus-dropbox
    octave
    openvpn
    playonlinux
    psensor
    puredata
    qbittorrent
    rkhunter
    spotify-client
    steam
    synaptic
    thunderbird
    timeshift
    torbrowser-launcher
    ubuntu-gnome-desktop
    vagrant
    veracrypt
    vim
    virtualbox
    vlc
    wine
"

snap_software="
    keepassxc
"

for soft in $apt_software; do
    echo "Installing $soft"
    apt -y install $soft
done

for soft in $snap_software; do
    echo "Installing $soft"
    yes | snap install $soft
done

###############################################################################
# UBUNTU STUDIO
###############################################################################

# Sets Ubuntu up to handle audio work
# Info pulled from https://help.ubuntu.com/community/UbuntuStudioPreparation:w
# Be aware, info might be outdated

studio_software="
    jackd
    libffado2
    linux-lowlatency
    qjackctl
"

for soft in $studio_software; do
    echo "Installing $soft"
    apt -y install $soft
done

## Firewire setup
adduser $USER audio
firewire_software="
    ffado-mixer-qt4
    jackd2-firewire
    pulseaudio-module-jack
    patchage
"

for soft in $firewire_software; do
    echo "Installing $soft"
    apt -y install $soft
done

###############################################################################
# RESTRICTED EXTRAS
###############################################################################

# Based upon 16.04(xenial) package except without flash
# https://packages.ubuntu.com/en/xenial/ubuntu-restricted-extras
# Will need to be updated for future versions

restrict_software="
    libavcodec-extra
    gstreamer1.0-fluendo-mp3
    gstreamer1.0-libav
    gstreamer1.0-plugins-bad
    gstreamer1.0-plugins-ugly
    oxideqt-codecs-extra
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
gsettings set org.gnome.desktop.background picture-uri file:////~/docfiles/wallpaper/dual_wallpaper.jpg

# Final check to make sure all software is up to date
apt update
apt -y upgrade
apt -y dist-upgrade
apt -y autoremove
reboot
