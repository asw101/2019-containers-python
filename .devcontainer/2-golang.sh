# https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
# see: https://golang.org/doc/install

VERSION='1.13.4'
OS='linux'
ARCH='amd64'

curl -OL https://dl.google.com/go/go${VERSION}.${OS}-${ARCH}.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
rm go$VERSION.$OS-$ARCH.tar.gz

sudo echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile
