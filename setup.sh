#!/bin/sh
sudo apt install gnupg2 pass

# install golang and define PATH
sudo apt-get install -y --no-install-recommends golang
mkdir /home/pi/go
export GOPATH=/home/pi/go

# download the docker-credential-helpers repository
cd $GOPATH
go get github.com/docker/docker-credential-helpers

# compile docker-credential-pass and 
cd $GOPATH/src/github.com/docker/docker-credential-helpers/
make pass
# move the compiled sources to /usr/bin
sudo cp bin/docker-credential-pass /usr/bin

sudo apt-get remove golang
sudo apt-get autoremove

gpg --generate-key  

echo "Execute command: pass init <gpgid>"
