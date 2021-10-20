#!/bin/sh

# debian bullseye

sudo apt update
sudo apt upgrade -y
sudo apt install -y ripgrep ncdu ranger fzf git htop fd-find jq rsync autossh mosh bat psmisc

sudo apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# curl -fsSL https://deno.land/x/install/install.sh | sh

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs

# neovim lsp stuff 
sudo npm install -g typescript-language-server typescript bash-language-server graphql-language-service-cli

echo " ~~~ Consider hand-installing neovim"


# nix-env, nix pkgs
# echo "Consider installing https://github.com/ipinfo/cli"
