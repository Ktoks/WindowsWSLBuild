#!/bin/bash
cd || exit 1
apt install sudo
err=$?
if [ $err != 0 ] ; then
    echo "error installing sudo: $err"
    exit 1
fi
adduser harbad
usermod -aG sudo harbad
apt update
apt dist-upgrade -y
err=$?
if [ $err != 0 ] ; then
    echo "error upgrading: $err"
    exit 1
fi
apt install golang-go
err=$?
if [ $err != 0 ] ; then 
    echo "error installing go: $err"
    exit 1
fi
echo "export GOROOT=/usr/local/go
export GOPATH=\$HOME/go
export PATH=\$GOPATH/bin:#GOROOT/BIN:\$PATH" >> ~/.bashrc
git --version
err=$?
if [ $err = 127 ] ; then
    apt install git
    err=0
fi
git config --global user.name "kacystocks"
git config --global user.email "kstocks0811@gmail.com"
git config --global core.autocrlf false
cd ~ || exit 1
mkdir .ssh
chmod 700 .ssh
apt install python3 python3-pip ipython3
err=$?
if [ $err != 0 ] ; then
    echo "error installing python 3, pip, or ipython 3: $err"
    exit 1
fi
apt install shellcheck
err=$?
if [ $err != 0 ] ; then
    echo "error installing shellcheck: $err"
    exit 1
fi
apt install texlive-latex-recommended texlive-metapost texlive-fonts-recommended
err=$?
if [ $err != 0 ] ; then
    echo "error installing LaTeX: $err"
    exit 1
fi
apt install zsh -y
err=$?
if [ $err != 0 ] ; then
    echo "error installing zsh: $err"
    exit 1
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
err=$?
if [ $err != 0 ] ; then
    echo "error installing oh my zsh: $err"
    exit 1
fi
echo "if [ -t 1 ] ; then
exec zsh
fi" >> ~/.bashrc
apt install vim-gtk
err=$?
if [ $err != 0 ] ; then
    echo "error installing vim-gtk: $err"
    exit 1
fi
curl https://cli-assets.heroku.com/install.sh | sh
err=$?
if [ $err != 0 ] ; then
    echo "error installing heroku: $err"
    exit 1
fi
apt install build-essential
err=$?
if [ $err != 0 ] ; then
    echo "error installing build-essential: $err"
    exit 1
fi
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
err=$?
if [ $err != 0 ] ; then
    echo "error installing npm: $err"
    exit 1
fi
npm install vue
err=$?
if [ $err != 0 ] ; then
    echo "error installing vue: $err"
    exit 1
fi
apt update && apt upgrade -y
echo "---------------------
It is suggested you run these commands with your
username once this script has finished:
cd .ssh || exit 1
cp /mnt/c/Users/{insert your username here}/.ssh/id_rsa* .
chmod 600 id_rsa
chmod 644 id_rsa.pub
---------------------"
echo "After running the above suggested commands,
Please copy your rsa key and paste it to
your github's authorized keys using this command:
cat ~/.ssh/id_rsa.pub
---------------------"
echo "Restart this terminal for all changes to take effect."
