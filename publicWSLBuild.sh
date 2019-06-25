#!/bin/sh
if [ whoami != "$ROOT" ] ; then
    echo "error, please run this script as root"
    exit 1
fi

apt-get install sudo
if [ $? != 0 ] ; then
    echo "error installing sudo: $?"
    exit 1
fi
sudo apt-get update
sudo apt dist-upgrade -y
if [ $? != 0 ] ; then
    echo "error upgrading: $?"
    exit 1
fi
sudo apt-get install golang-go
if [ $? != 0 ] ; then 
    echo "error installing go: $?"
    exit 1
fi
echo "export GOROOT=/usr/local/go
export GOPATH=\$HOME/go
export PATH=\$GOPATH/bin:#GOROOT/BIN:\$PATH" >> ~/.bashrc
git --version
if [ $? = 127 ] ; then
    sudo apt install git
fi
git config --global core.autocrlf false
cd ~ || exit 1
mkdir .ssh
chmod 700 .ssh
echo "It is suggested you run these commands with your
username once this script has finished:
cd .ssh || exit 1
cp /mnt/c/Users/{insert your username here}/.ssh/id_rsa* .
chmod 600 id_rsa
chmod 644 id_rsa.pub"
sudo apt install python3 python3-pip ipython3
if [ $? != 0 ] ; then
    echo "error installing python 3, pip, or ipython 3: $?"
    exit 1
fi
sudo apt install shellcheck
if [ $? != 0 ] ; then
    echo "error installing shellcheck: $?"
    exit 1
fi
git clone https://github.com/aimacode/aima-python.git
if [ $? != 0 ] ; then
    echo "error cloning aima-python repo: $?"
    exit 1
fi
pip install -r requirements.txt
if [ $? != 0 ] ; then
    echo "error installing aima requirements: $?"
    exit 1
fi
cd aima-python || exit 1
git submodule init
git submodule update
pip install pytest
if [ $? != 0 ] ; then
    echo "error installing pytest: $?"
    exit 1
fi
sudo apt-get install texlive-latex-recommended texlive-metapost texlive-fonts-recommended
if [ $? != 0 ] ; then
    echo "error installing LaTeX: $?"
    exit 1
fi
sudo apt-get install zsh -y
if [ $? != 0 ] ; then
    echo "error installing zsh: $?"
    exit 1
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
if [ $? != 0 ] ; then
    echo "error installing oh my zsh: $?"
    exit 1
fi
#echo "if [ -t 1 ] ; then
#    exec zsh
#fi" >> ~/.bashrc
sudo apt-get install vim-gtk -y
if [ $? != 0 ] ; then
    echo "error installing vim-gtk: $?"
    exit 1
fi
sudo curl https://cli-assets.heroku.com/install.sh | sh
if [ $? != 0 ] ; then
    echo "error installing heroku: $?"
    exit 1
fi
sudo apt-get install build-essential
if [ $? != 0 ] ; then
    echo "error installing build-essential: $?"
    exit 1
fi
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
if [ $? != 0 ] ; then
    echo "error installing npm: $?"
    exit 1
fi
npm install vue
if [ $? != 0 ] ; then
    echo "error installing vue: $?"
    exit 1
fi
sudo apt update && apt upgrade -y
echo "After running the above suggested commands,
Please copy your rsa key and paste it to
your github's authorized keys using this command:
cat ~/.ssh/id_rsa.pub"
