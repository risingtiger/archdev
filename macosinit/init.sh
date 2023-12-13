#!/bin/bash 


cd ~/Desktop


mkdir -p ~/.config


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin


