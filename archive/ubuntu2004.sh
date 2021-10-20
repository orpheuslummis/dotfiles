#!/bin/bash
# Run this script from dotfiles/

# - settings
# 	- trackpad max speed
# 	- auto-hide dock
# - terminal settings
# 	- hide menu
# 	- disable F10
# - install dotfiles
# 	- install git curl
# 	- setup ssh keys
# 	- clone from gitlab, then `./install.sh`

## FIXME
# powertop
# configure Ubuntu only via this script -- extensive gsettings?
# disable rhythmbox plugins
# touchpad speed increase
# keyboard delay increase
#- disable some search types
#- disable bluetooth

sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y \
    build-essential \
    pkg-config \
    net-tools \
    curl \
    git \
    ncdu \
    powertop \
    silversearcher-ag \
    xsel

# for Latex
# sudo apt-get install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-science

# GNOME
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.shell.app-switcher current-workspace-only true
#gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
# gsettings set org.gnome.desktop.peripherals.touchpad speed 3.0
# gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
# gsettings set org.blueman.plugins.powermanager auto-power-on false
