echo "Installing Golang"
wget https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz
sudo tar -xvf go1.15.5.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go'   >> ~/.bash_profile
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
sudo rm go1.15.5.linux-amd64.tar.gz
echo "Installing Findomain"
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
sudo mv findomain-linux /usr/local/bin/findomain
GO111MODULE=auto go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder
export GO111MODULE=on
go get -v github.com/OWASP/Amass/v3/...
go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/httprobe
go get -u github.com/tomnomnom/anew
GO111MODULE=auto go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
GO111MODULE=on go get github.com/jaeles-project/jaeles
git clone https://github.com/jaeles-project/jaeles-signatures
git clone https://github.com/projectdiscovery/nuclei-templates
git clone https://github.com/cybertron10/Mysignature
go get -u github.com/tomnomnom/qsreplace
GO111MODULE=auto go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder
go get -u github.com/jaeles-project/gospider
git clone https://github.com/gwen001/github-search
go get github.com/hakluke/hakrawler
wget https://github.com/brentp/gargs/releases/download/v0.3.9/gargs_linux
chmod +x gargs_linux 
sudo mv gargs_linux /usr/local/bin/gargs
go get -u github.com/tomnomnom/waybackurls
go get -u github.com/tomnomnom/gf
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir .gf
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns
sudo mv ~/Gf-Patterns/*.json ~/.gf
GO111MODULE=on go get -u -v github.com/lc/gau
GO111MODULE=on go get -u github.com/projectdiscovery/chaos-client/cmd/chaos
export CHAOS_KEY="f286eddccad5d2001cf46b5485371cdd65b0e0e1da5a774cee0bba0378d741f2"
