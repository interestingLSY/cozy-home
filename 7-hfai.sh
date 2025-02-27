#!/bin/bash
. common.sh

pip3 install hfai[full] --extra-index-url https://pypi.hfai.high-flyer.cn/simple --trusted-host pypi.hfai.high-flyer.cn --proxy http://localhost:20172
