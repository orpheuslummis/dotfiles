#!/bin/sh

ln -sfv $PWD/profile $HOME/.profile
ln -sfv $PWD/gitconfig $HOME/.gitconfig
ln -sfv $PWD/tmux.conf $HOME/.tmux.conf

#ln -sfv $PWD/gitignore $HOME/.gitignore
#ln -sfv $PWD/zprofile $HOME/.zprofile
#ln -sfv $PWD/zsh_history $HOME/.zsh_history

mkdir -p $HOME/.config
rm -rf $HOME/.config/nvim
ln -sfv $PWD/config/nvim $HOME/.config/nvim
rm -rf $HOME/.config/ranger
ln -sfv $PWD/config/ranger $HOME/.config/ranger
rm -rf $HOME/.config/htop
ln -sfv $PWD/config/htop $HOME/.config/htop

mkdir -p $HOME/.ssh
rm $HOME/.ssh/config
ln -sfv $PWD/ssh/config $HOME/.ssh/config

rm $HOME/.customize_environment
ln -sfv $PWD/cloudshell/customize_environment $HOME/.customize_environment

# nvim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall
