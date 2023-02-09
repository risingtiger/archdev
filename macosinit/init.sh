#!/bin/bash 


cd ~/Desktop


mkdir -p ~/.config


cp -r ~/Desktop/configs/kitty ~/.config/kitty
cp -r ~/Desktop/configs/karabiner ~/.config/karabiner
cp -r ~/Desktop/configs/ignore ~/.ignore



/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
