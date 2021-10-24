#!/bin/sh

ln -sfv $PWD/profile $HOME/.profile
ln -sfv $PWD/gitconfig $HOME/.gitconfig
ln -sfv $PWD/tmux.conf $HOME/.tmux.conf

rm -f $HOME/.bash_history
ln -sfv $PWD/bash_history $HOME/.bash_history

#ln -sfv $PWD/gitignore $HOME/.gitignore
#ln -sfv $PWD/zprofile $HOME/.zprofile
#ln -sfv $PWD/zsh_history $HOME/.zsh_history

mkdir -p $HOME/.config
rm -rf $HOME/.config/ranger
ln -sfv $PWD/config/ranger $HOME/.config/ranger
rm -rf $HOME/.config/htop
ln -sfv $PWD/config/htop $HOME/.config/htop
rm -rf $HOME/.config/procps
ln -sfv $PWD/config/procps $HOME/.config/procps
#rm -rf $HOME/.config/nvim
#ln -sfv $PWD/config/nvim $HOME/.config/nvim

mkdir -p $HOME/.ssh
rm -f $HOME/.ssh/config
ln -sfv $PWD/ssh/config $HOME/.ssh/config
cp $PWD/ssh/id_ed25519 $HOME/.ssh/id_ed25519
chmod 600 $HOME/.ssh/id_ed25519
cp  $PWD/ssh/id_ed25519.pub $HOME/.ssh/id_ed25519.pub
chmod 600 $HOME/.ssh/id_ed25519.pub

# nvim plugins
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#nvim +PlugInstall
