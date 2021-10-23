#! /bin/bash

today=$(date -u +%Y-%m-%d)
echo "SHUTDOWN!! $today"
sudo -u o sh -c "mv $HOME/dev/dotfiles/bash_history $HOME/dev/dotfiles/bash_history.$today.bak"
sudo -u o sh -c "cp $HOME/.bash_history $HOME/dev/dotfiles/"
