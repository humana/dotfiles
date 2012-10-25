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
ln -s bundle ~/.vim/bundle
ln -s vimrc ~/.vimrc
vim +BundleInstall +qall

# git
ln -s gitconfig ~/.gitconfig

# bash
ln -s bashrc ~/.bashrc
ln -s bash_profile ~/.bash_profile

# gtk
if [ ! -d ~/.config/gtk-3.0 ]
	mkdir -p ~/.config/gtk-3.0
fi
cp misc/gtk.css ~/.config/gtk-3.0/
