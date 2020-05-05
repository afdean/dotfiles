#!/bin/bash

# Author: Andrew Dean
# Description: Sets up clean install of ubuntu

# Notes:
# IMPORTANT: If you did not encrypt on install, you need to re-install
# If dual booting, install second
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
apt -y full-upgrade

###############################################################################
# Repositories & Downloads
###############################################################################

# Info from https://github.com/ValveSoftware/Proton/wiki/Requirements
# Remove paulo-miguel-dias if mesa-vulkan-drivers not needed
repos="
    ppa:lutris-team/lutris
    ppa:paulo-miguel-dias/pkppa
    ppa:pdesaulniers/wolf
    ppa:sebastian-stenzel/cryptomator
    ppa:unit193/encryption
"

for repo in $repos; do
    echo "Adding $repo"
    add-apt-repository -y $pkg
done

# Joplin
# Info from https://joplinapp.org/
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

# KX Studio
# Info from https://kx.studio/Repositories
sudo apt-get install apt-transport-https software-properties-common wget
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_9.5.1~kxstudio3_all.deb
sudo dpkg -i kxstudio-repos_9.5.1~kxstudio3_all.deb
sudo apt-get install libglibmm-2.4-1v5
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos-gcc5_9.5.1~kxstudio3_all.deb
sudo dpkg -i kxstudio-repos-gcc5_9.5.1~kxstudio3_all.deb

# Signal
# Info from https://signal.org/download/
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# VSCodium
# Info from https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list

# Update all of the repos to be used
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
    python-pip
    python3-pip
    r-base
    r-base-dev
"
# Using default openjdk for java

for pkg in $coding_pkg; do
    echo "Installing $pkg"
    apt -y install $pkg
done

# Pip installs
sh ./pip.sh

# Git settings
sh ./git.sh

###############################################################################
# SOFTWARE
###############################################################################

apt_software="
    alacarte
    anki
    ardour
    asunder
    baobab
    blender
    bristol
    cadence
    calf-plugins
    calibre
    caps
    carla
    clonezilla
    cmake
    compizconfig-settings-manager
    cryptomator
    ctags
    dexed
    dnscrypt-proxy
    dolphin-emu
    drmr
    drumgizmo
    drumkv1
    eclipse
    exuberent-ctags
    eq10q
    gnome-tweak-tool
    guitarix
    fabla
    ffado-mixer-qt4
    ffmpegthumbnailer
    filezilla
    firefox
    hydrogen
    jackd2-firewire
    libreoffice
    linux-lowlatency
    linuxsampler-all
    lutris
    mesa-vulkan-drivers
    mesa-vulkan-drivers:i386
    nautilus-admin
    nautilus-dropbox
    neofetch
    ncdu
    octave
    openvpn
    pavucontrol
    playonlinux
    psensor
    pulseaudio-module-jack
    puredata
    qbittorrent
    qsampler
    signal-desktop
    soundconverter
    steam
    synaptic
    tal-plugins-vst
    thunderbird
    timeshift
    torbrowser-launcher
    vagrant
    veracrypt
    vim
    virtualbox
    vlc
    vulkan-utils
    vscodium
    wine
    zynaddsubfx-git
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

# Downloads: helm, joplin, LSP (plugins)

###############################################################################
# Firewire Setup
###############################################################################

# Sets Ubuntu up to handle a firewire audio interface
# Info pulled from
#   https://help.ubuntu.com/community/UbuntuStudioPreparation
#   https://linuxmusicians.com/viewtopic.php?t=18016

## Firewire setup
adduser $USER audio
# Make blacklist-snd_dice.conf in etc/modprobe.d and blacklist snd_dice
# Boot in low latency kernel
# Configure Cadence settings for firewire (ffado) backend

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

apt update
apt -y full-upgrade
apt -y autoremove
reboot
