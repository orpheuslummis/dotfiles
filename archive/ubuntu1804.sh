#!/bin/bash
# Run this script from dotfiles/

# manual steps...

# - setup chrome
# 	- install bitwarden
# 	- setup sync
# - settings
# 	- trackpad max speed
# 	- auto-hide dock
# 	- disactivate "search"
# 	- disactivate "connectivity checking"
# 	- activate "night light"
# 	- disactivate "dim when inactive"
# - terminal settings
# 	- hide menu
# 	- disable F10
# - chrome settings
# 	- disable using system title bar
# 	- more filters in ublock
# - install dotfiles
# 	- install git curl
# 	- setup ssh keys
# 	- clone from gitlab, then `./install.sh`
# - install some pkgs manually...
# 	- docker

# TBD:
# - wireguard
# - virtualbox
# - gnome extensions


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
    chromium-browser \
    curl \
    git \
    ncdu \
    powertop \
    silversearcher-ag \
    xsel \ 
    zsh

# for Latex
# sudo apt-get install -y texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-science

# GNOME
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
# gsettings set org.gnome.desktop.peripherals.touchpad speed 3.0
# gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
# gsettings set org.blueman.plugins.powermanager auto-power-on false

# powertop
sudo apt install -y powertop

<< EOF | sudo tee /etc/systemd/system/powertop.service
[Unit]
Description=PowerTOP auto tune

[Service]
Type=idle
Environment="TERM=dumb"
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable powertop.service