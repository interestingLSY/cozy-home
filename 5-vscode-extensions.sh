#!/usr/bin/bash

# DS_PROXY="http://deepseek:+ogyigDac5@ss.deepseek.com:3128"
export http_proxy="http://localhost:20172"

EXTENSIONS=(
	ms-python.python
	ms-python.vscode-pylance
	ms-python.pylint
	GitHub.copilot
	matthewnespor.vscode-color-identifiers-mode
	twxs.cmake
)

for EXTENSION in ${EXTENSIONS[@]}; do
	echo "-----------------------"
	echo "Installing $EXTENSION"
	~/.vscode-server/cli/servers/Stable-e54c774e0add60467559eb0d1e229c6452cf8447/server/bin/code-server --install-extension $EXTENSION
done

