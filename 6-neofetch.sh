#!/bin/bash
. common.sh

REPO_PATH=$(pwd)
cd ~/temp
rm -rf neofetch
git clone https://github.com/dylanaraps/neofetch.git --depth=1
cp neofetch/neofetch ~/.local/bin/neofetch