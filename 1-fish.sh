. common.sh

CUR_PATH=$(pwd)
echo "Installing fish..."
cd ~/temp
wget -c "https://github.com/xxh/fish-portable/releases/download/3.6.1/fish-portable-musl-alpine-Linux-x86_64.tar.gz" -O fish.tag.gz
mkdir -p fish
tar xf fish.tag.gz -C fish
cp -r fish/bin/* ~/.local/bin/.
cp -r fish/etc/* ~/.local/etc/.
cp -r fish/share/* ~/.local/share/.

cd ${CUR_PATH}
mkdir -p ~/.config/fish/
cp templates/config.fish ~/.config/fish/config.fish
echo "fish_add_path ${HOME}/.local/bin" >> ~/.config/fish/config.fish

touch ~/startup.sh
chmod +x ~/startup.sh
echo "#!/bin/bash" > ~/startup.sh
echo "export HOME=${HOME}" >> ~/startup.sh
echo "${HOME}/.local/bin/fish" >> ~/startup.sh


