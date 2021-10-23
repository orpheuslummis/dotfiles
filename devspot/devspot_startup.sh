#! /bin/bash
mkdir -p /home/o/dev/
mount -o discard,defaults /dev/sdb /home/o/dev/
sudo -u o sh -c 'cd /home/o/dev/dotfiles && ./setup_workspace.sh'
sudo -u o sh -c '/home/o/dev/lib/openvscode-server-v1.61.0-linux-x64/server.sh &'
apt update
apt -y install ncdu bat tmux git fzf 
