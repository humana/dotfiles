#!/bin/sh

cd ~/.dotfiles

git submodule init
git submodule update

# backups
if [ ! -d bak ]; then
	mkdir bak
fi
mv ~/.vim bak/
mv ~/.vimrc bak/
mv ~/.bashrc bak/
mv ~/.bash_profile bak/

# vim install
if [ ! -d ~/.vim ]; then
	mkdir ~/.vim
fi
mv bundle ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
vim +BundleInstall +qall

# bash
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/bashrc_profile ~/.bash_profile
