#!/bin/bash

# Author: Andrew Dean
# Description: Sets up clean install of ubuntu

# IMPORTANT NOTES:
# Check info's in repos/dls/restr-extras and update as necessary
# If you did not encrypt on install, you need to re-install
# Do not automatically install restricted extras with installation, they
# are included here
# If dual booting, install ubuntu second
# Upon completion, machine will reboot
# Should be run once with sudo privileges
# Can run multiple times without problems, if needed
# Remember to chmod +x the script
# This is the very first thing to be run on a clean install
# If problems with dependencies, run apt-get -f remove

###############################################################################
# UPDATE AND UPGRADE
###############################################################################

apt update
apt -y full-upgrade

###############################################################################
# Privacy
###############################################################################

# Double check all privacy settings in Ubuntu menu
apt -y remove popularity-contest
ufw enable
ubuntu-report -f send no

###############################################################################
# Repositories & Downloads
###############################################################################

# Steam (Mesa, VR, general)
# Info from https://github.com/ValveSoftware/Proton/wiki/Requirements
# and https://github.com/ValveSoftware/SteamVR-for-Linux#amd
# IMPORTANT: Review the READMEs before clean install, and review apt list
# 2019, list was linux-generic-steamvr-18.04, xserver-xorg-hwe-18.04 and mesas
# IMPORTANT: Remove ppa if/when drivers are included in kernel

repos="
    ppa:kisak/steamvr
    ppa:lutris-team/lutris
    ppa:sebastian-stenzel/cryptomator
    ppa:unit193/encryption
"

for repo in $repos; do
    echo "Adding $repo"
    add-apt-repository -y $pkg
done

# KX Studio
# Info from https://kx.studio/Repositories
sudo apt-get install apt-transport-https gpgv
sudo dpkg --purge kxstudio-repos-gcc5
wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_10.0.3_all.deb
sudo dpkg -i kxstudio-repos_10.0.3_all.deb

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

# Wunderlistux
# Info from https://github.com/edipox/wunderlistux
wget https://github.com/edipox/wunderlistux/releases/download/Linux-0.0.8/Wunderlistux_0.0.8_amd64.deb
sudo apt install ./Wunderlistux_0.0.8_amd64.deb

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
    amsynth
    anki
    ardour
    arpage
    asunder
    baobab
    blender
    bristol
    cadence
    calf-plugins
    calibre
    caps
    caps-lv2
    carla
    chkrootkit
    clonezilla
    cmake
    codium
    compizconfig-settings-manager
    cryptomator
    ctags
    dexed-lv2
    dexed-vst
    dnscrypt-proxy
    dolphin-emu
    dragonfly-reverb
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
    gimp
    gufw
    gxplugins
    helm
    hybridreverb2
    hydrogen
    jackd2-firewire
    klangfalter-lv2
    klangfalter-vst
    libreoffice
    linux-generic-steamvr-18.04
    linux-lowlatency
    linuxsampler-all
    lsp-plugins
    luftikus-lv2
    luftikus-vst
    lutris
    mesa-vulkan-drivers
    mesa-vulkan-drivers:i386
    nautilus-admin
    nautilus-dropbox
    neofetch
    ncdu
    obxd-lv2
    obxd-vst
    octave
    openvpn
    pavucontrol
    pitcheddelay-lv2
    pitcheddelay-vst
    pizmidi-plugins
    psensor
    pulseaudio-module-jack
    puredata
    qbittorrent
    qsampler
    rubberband-lv2
    safe-plugins
    samplv1
    samplv1-lv2
    signal-desktop
    soundconverter
    steam
    surge
    synaptic
    tal-plugins-lv2
    tal-plugins-vst
    tap-lv2
    teragonaudio-plugins-lv2
    teragonaudio-plugins-vst
    thunderbird
    timeshift
    torbrowser-launcher
    vagrant
    veracrypt
    vim
    virtualbox
    vlc
    vulkan-utils
    wine
    wolf-shaper
    x42-plugins
    xserver-xorg-hwe-18.04
    zam-plugins
    zynaddsubfx
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
