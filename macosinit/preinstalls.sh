#!/bin/bash 

cd ~/Desktop

#git config --global user.email "davis@risingtiger.com" \
#git config --global user.name "Davis Hammon"


mkdir -p ~/.ssh

mkdir -p ~/.config

chmod u=rwx,g=,o= ~/.ssh

cp -r /Volumes/Pantry/init/ssh/* ~/.ssh/.

git clone git@github.com:risingtiger/configs.git

cp -r ~/Desktop/configs/nvim ~/.config/nvim

cp -r ~/Desktop/configs/kitty ~/.config/kitty

cp -r ~/Desktop/configs/ignore ~/.ignore

