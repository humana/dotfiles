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
mv ~/.emacs.d bak/ 
mv ~/.bashrc bak/
mv ~/.bash_profile bak/
mv ~/.gitconfig bak/

# vim install
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
mkdir -p ~/.dotfiles/vim/autoload ~/.dotfiles/vim/bundle

# neovim
mkdir -p ~/.config
ln -s ~/.dotfiles/vim ~/.config/nvim
ln -s ~/.dotfiles/vimrc ~/.config/nvim/init.vim

# ideavim for pycharm
ln -s ~/.dotfiles/ideavimrc ~/.ideavimrc

# git
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

# bash
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

# zsh
ln -s ~/.dotfiles/zshrc ~/.zshrc

# gtk
if [ ! -d ~/.config/gtk-3.0 ]; then
	mkdir -p ~/.config/gtk-3.0
fi
cp misc/gtk.css ~/.config/gtk-3.0/

# tmux
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

# emacs prelude
ln -s ~/.dotfiles/emacs/prelude ~/.emacs.d
rm -rf ~/.dotfiles/emacs/prelude/personal
ln -s ~/.dotfiles/emacs/personal ~/.emacs.d/personal
ln -s ~/.dotfiles/emacs/prelude-modules.el ~/.emacs.d/prelude-modules.el

# vscode
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json

# latex
ln -s ~/.dotfiles/latex/latexmkrc ~/.latexmkrc
ln -s ~/.dotfiles/latex/texmf ~/texmf
texhash
texhash ~/texmf


