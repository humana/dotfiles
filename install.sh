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
mv ~/.gitconfig bak/

# vim install
if [ ! -d ~/.vim ]; then
	mkdir ~/.vim
fi
cp ~/.dotfiles/bundle ~/.vim/
ln -s ~/.dotfiles/vimrc ~/.vimrc
vim +BundleInstall +qall

# git
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

# bash
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

# gtk
if [ ! -d ~/.config/gtk-3.0 ]; then
	mkdir -p ~/.config/gtk-3.0
fi
cp misc/gtk.css ~/.config/gtk-3.0/
