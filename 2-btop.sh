. common.sh

echo "Installing btop..."
cd ~/temp
wget -c "https://github.com/aristocratos/btop/releases/download/v1.3.2/btop-x86_64-linux-musl.tbz" -O btop.tbz
mkdir -p btop
tar -xf btop.tbz -C btop
cp btop/btop/bin/btop ~/.local/bin/btop
mkdir -p ~/.local/share/btop
cp -r btop/btop/themes ~/.local/share/btop/.

