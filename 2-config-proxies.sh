#!/bin/bash

. common.sh

# PROXY="http://deepseek:+ogyigDac5@ss.deepseek.com:3128"
PROXY="http://localhost:20172"

# git proxy
git config --global user.email "shengyuliu@deepseek.com"
git config --global user.name "Shengyu Liu"
git config --global http.proxy $PROXY
git config --global https.proxy $PROXY
git config --global http.sslVerify false

cat <<EOF > ~/.ssh/config
Host github.com
    HostName ssh.github.com
    Port 443
    ServerAliveInterval 55
    ForwardAgent yes
    ProxyCommand nc --proxy 127.0.0.1:20172 %h %p
EOF

# wget proxy
cat <<EOF > ~/.wgetrc
use_proxy=yes
http_proxy=$PROXY
https_proxy=$PROXY
EOF

# curl proxy
cat <<EOF > ~/.curlrc
--proxy $PROXY
EOF

# conda proxy
conda config --set proxy_servers.http $PROXY
conda config --set proxy_servers.https $PROXY
