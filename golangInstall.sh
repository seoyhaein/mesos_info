#!/usr/bin/env bash

SHELL_PATH=`pwd -P`

mkdir -p ${SHELL_PATH}/Arch && cd ${SHELL_PATH}/Arch
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz

echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
. ~/.bashrc

cat > /etc/profile.d/golang-env.sh << 'EOF'
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin:$GOBIN
EOF

. /etc/profile.d/golang-env.sh

##
Hi naman,
Please check source is a shell builtin or not , in that you run this command:
[root@ ~]# type source
source is a shell builtin

Otherwise, please try this:

use '.' instead of 'source'

#!/bin/sh

. ~/.bash_profile

or

/bin/bash -c 'source ~/.bash_profile'
