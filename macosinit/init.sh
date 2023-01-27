#!/bin/bash 


cd ~/Desktop


mkdir -p ~/.ssh
chmod u=rwx,g=,o= ~/.ssh
cp -r /Volumes/Pantry/init/ssh/* ~/.ssh/.


mkdir -p ~/.config


git config --global user.email "davis@risingtiger.com" \
git config --global user.name "Davis Hammon"
git clone git@github.com:risingtiger/configs.git


cp -r ~/Desktop/configs/zshrc ~/.zshrc
cp -r ~/Desktop/configs/nvim ~/.config/nvim
cp -r ~/Desktop/configs/kitty ~/.config/kitty
cp -r ~/Desktop/configs/nvim ~/.config/nvim
cp -r ~/Desktop/configs/karabiner ~/.config/karabiner
cp -r ~/Desktop/configs/ignore ~/.ignore



/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
