. common.sh

echo "Installing zellij..."
cd ~/temp
wget -c "https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz" -O zellij.tar.gz
mkdir -p zellij
tar xf zellij.tar.gz -C zellij
cp ~/temp/zellij/zellij ~/.local/bin/zellij

