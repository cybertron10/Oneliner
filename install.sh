apt install python3-pip
pip3 install uro
echo "Installing Golang"
wget https://dl.google.com/go/go1.17.8.linux-amd64.tar.gz
sudo tar -xvf go1.17.8.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go'   >> ~/.bash_profile
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
sudo rm go1.17.8.linux-amd64.tar.gz
echo "Installing Findomain"
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
sudo mv findomain-linux /usr/local/bin/findomain
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go get -v github.com/OWASP/Amass/v3/...
go install -v github.com/tomnomnom/assetfinder@latest
go install -v github.com/tomnomnom/httprobe@latest
go install -v github.com/tomnomnom/anew@latest
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
go install -v github.com/jaeles-project/jaeles@latest
apt install git
git clone https://github.com/jaeles-project/jaeles-signatures
git clone https://github.com/projectdiscovery/nuclei-templates
go install -v github.com/tomnomnom/qsreplace@latest
go install -v github.com/jaeles-project/gospider@latest
go get github.com/hakluke/hakrawler
wget https://github.com/brentp/gargs/releases/download/v0.3.9/gargs_linux
chmod +x gargs_linux 
sudo mv gargs_linux /usr/local/bin/gargs
go install -v github.com/tomnomnom/waybackurls@latest
go install -v github.com/tomnomnom/gf@latest
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir .gf
git clone https://github.com/1ndianl33t/Gf-Patterns
sudo mv ~/Gf-Patterns/*.json ~/.gf
GO111MODULE=on go get -u -v github.com/lc/gau
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
