#! /bin/bash

# Backup dirs
mkdir undodir
mkdir backup

sudo pip install neovim
sudo pip3 install neovim

# vim-plug
curl -fLo ./autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c :PlugInstall
