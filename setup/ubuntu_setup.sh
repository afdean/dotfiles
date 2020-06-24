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
# IMPORTANT: Review the READMEs before clean install, and review $apt_steam
# IMPORTANT: Remove ppa if/when drivers are included in kernel

repos="
    ppa:lutris-team/lutris
    ppa:paulo-miguel-dias/pkppa
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

apt_kx="
    amsynth
    arpage
    arctican-plugins-lv2
    arctican-plugins-vst
    artyfx
    avldrums.lv2
    bchoppr
    beatslash-lv2
    bshapr
    bslizr
    cadence
    calf-plugins
    caps
    caps-lv2
    carla
    cmt
    dexed-lv2
    dexed-vst
    distrho-plugin-ports-lv2
    distrho-plugin-ports-vst
    dpf-plugins
    dragonfly-reverb
    drmr
    drowaudio-plugins-lv2
    drowaudio-plugins-vst
    drumgizmo
    drumkv1
    drumkv1-lv2
    easyssp-lv2
    easyssp-vst
    eq10q
    guitarix
    fabla
    gxplugins
    helm
    hybridreverb2
    infamous-plugins
    invada-studio-plugins-lv2
    juced-plugins-lv2
    juced-plugins-vst
    klangfalter-lv2
    klangfalter-vst
    linuxsampler-all
    lsp-plugins
    lufsmeter-lv2
    lufsmeter-vst
    luftikus-lv2
    luftikus-vst
    mod-distortion
    mod-pitchshifter
    obxd-lv2
    obxd-vst
    oxefmsynth
    pitcheddelay-lv2
    pitcheddelay-vst
    pizmidi-plugins
    regrader
    rubberband-lv2
    safe-plugins
    samplv1
    samplv1-lv2
    shiro-plugins
    surge
    tal-plugins-lv2
    tal-plugins-vst
    tap-lv2
    temper-lv2
    temper-vst
    teragonaudio-plugins-lv2
    teragonaudio-plugins-vst
    wolf-shaper
    wolf-spectrum
    x42-plugins
    zam-plugins
    zynaddsubfx
"

apt_ppa="
    codium
    signal-desktop
"

apt_steam="
    mesa-vulkan-drivers
    mesa-vulkan-drivers:i386
"

apt_studio="
    ffado-mixer-qt4
    hydrogen
    jackd2-firewire
    linux-lowlatency
    pavucontrol
    pulseaudio-module-jack
    puredata
    qsampler
"

apt_general="
    alacarte
    anki
    asunder
    baobab
    calibre
    chkrootkit
    clonezilla
    cmake
    compizconfig-settings-manager
    cryptomator
    ctags
    dnscrypt-proxy
    dolphin-emu
    eclipse
    exuberent-ctags
    gnome-tweak-tool
    ffmpegthumbnailer
    filezilla
    firefox
    gimp
    gparted
    gramps
    gufw
    htop
    libdvd-pkg
    libreoffice
    lutris
    nautilus-admin
    nautilus-dropbox
    neofetch
    ncdu
    octave
    openvpn
    ppa-purge
    psensor
    puredata
    qbittorrent
    soundconverter
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
    vulkan-utils
    wine
"

apt_all=$apt_kx$apt_ppa$apt_steam$apt_studio$apt_general

# If software is here that is also apt installable, it's because it's more recently updated
snap_software="
    blender --classic
    brave
    keepassxc
    musescore
    spotify
"

for soft in $apt_all; do
    echo "Installing $soft"
    apt -y install $soft
done

for soft in $snap_software; do
    echo "Installing $soft"
    yes | snap install $soft
done

# Downloads: Ardour, Godot, Joplin, Oversteer, new-lg4ff

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

for soft in $restrict_software; do
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
