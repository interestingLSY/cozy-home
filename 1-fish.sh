#!/bin/bash
. common.sh

REPO_PATH=$(pwd)
echo "Installing fish..."
cd ~/temp
cp ${REPO_PATH}/assets/fish/fish-static-linux-x86_64.tar.xz .
rm -f fish fish_indent fish_key_reader
tar -xvf fish-static-linux-x86_64.tar.xz
mv ~/temp/fish ~/.local/bin/.
mv ~/temp/fish_indent ~/.local/bin/.
mv ~/temp/fish_key_reader ~/.local/bin/.

cd ${REPO_PATH}
mkdir -p ~/.config/fish/
cp assets/fish/config.fish ~/.config/fish/config.fish
cp assets/fish/fish_variables ~/.config/fish/fish_variables
mkdir -p ~/.config/fish/functions
cp -r assets/fish/functions/* ~/.config/fish/functions/.

echo "Appending content to ~/.profile. Please manually check whether content inside duplicates"
cat <<EOF >> ~/.profile
export PATH=\$PATH:~/.local/bin

# Switch to fish if is interactive
if [[ $- == *i* ]]
then
    fish
fi
EOF

chsh -s ${HOME}/.local/bin/fish
