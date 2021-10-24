#! /bin/bash

t=$(date -u +"%Y-%m-%d_%H%M")
echo "SHUTDOWN! $t"
mv $HOME/dev/dotfiles/bash_history $HOME/dev/dotfiles/bash_history.$t.bak
cp $HOME/.bash_history $HOME/dev/dotfiles/
