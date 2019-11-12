#! /bin/bash

# My prefered font
sudo apt install -y fonts-firacode

sudo apt-get -y update
sudo apt-get -y install zsh
sudo apt-get -y install curl

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed -e 's/^\s*chsh -s/sudo chsh -s/g' -e 's/^\s*env\szsh.*$/#/g')"

cd
ln -s -f .config/priba_setup/zsh/zshrc .zshrc
mv .oh-my-zsh .config/priba_setup/zsh/oh-my-zsh
cd ~/.config/priba_setup/zsh/oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
cd ~/.config/priba_setup/zsh/
cp myagnoster.zsh-theme ~/.config/priba_setup/zsh/oh-my-zsh/themes/
chsh -s `which zsh`
