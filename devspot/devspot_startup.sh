#! /bin/bash
mkdir -p /home/o/dev/
mount -o discard,defaults /dev/sdb /home/o/dev/

sudo -u o sh -c 'cd /home/o/dev/dotfiles && ./setup_workspace.sh'

sudo -u o sh -c '/home/o/dev/lib/openvscode-server-v1.61.0-linux-x64/server.sh &'

apt update
apt -y install ncdu bat tmux git fzf
apt -y curl gnupg software-properties-common curl build-essential

curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
apt-get install -y nodejs

curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install -y terraform
terraform -install-autocomplete