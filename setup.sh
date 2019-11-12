#! /bin/bash

# Installation zsh
sh zsh/install.sh

# Installation Byobu
sh byobu/install.sh

cd ~/.config
ln -s -f env_setup/nvim


# Installation NVIM
sh nvim/install.sh

gnome-session-quit
