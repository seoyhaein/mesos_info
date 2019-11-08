
#!/usr/bin/env bash

SHELL_PATH=`pwd -P`

mkdir -p ${SHELL_PATH}/Arch && cd ${SHELL_PATH}/Arch

echo "GO ROOT Setting~~"
wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz

echo "PATH Setting~~"
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc

echo "GOPATH,GOBIN Setting"

cat > /etc/profile.d/golang-env.sh << 'EOF'
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin:$GOBIN
EOF

echo "delve install"
source /etc/profile.d/golang-env.sh && go get -u github.com/go-delve/delve/cmd/dlv
