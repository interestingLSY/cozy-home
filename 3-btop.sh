#!/bin/bash
. common.sh

REPO_PATH=$(pwd)

echo "Installing btop..."
cd ~/temp
wget -c "https://github.com/aristocratos/btop/releases/download/v1.4.0/btop-x86_64-linux-musl.tbz" -O btop.tbz
mkdir -p btop
tar -xf btop.tbz -C btop
cp btop/btop/bin/btop ~/.local/bin/btop

mkdir -p ~/.local/share/btop
cp -r btop/btop/themes ~/.local/share/btop/.
cp ${REPO_PATH}/assets/btop/btop.conf ~/.config/btop/btop.conf
