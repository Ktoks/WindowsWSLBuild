#!/bin/bash
set -e
set -x
cd || exit 1
apt update
apt dist-upgrade -y
apt install golang-go
printf "export GOROOT=/usr/local/go
export GOPATH=\$HOME/go
export PATH=\$GOPATH/bin:#GOROOT/BIN:\$PATH" >> ~/.bashrc
git --version
err=$?
if [ $err = 127 ] ; then
    apt install git
    err=0
fi
printf "\n\n\n************** Attention **************"
printf "You should probably configure git:"
printf "git config --global user.name \"myusername\""
printf "git config --global user.email \"myemail@email.com\""
printf "\n\n\n************** Attention **************"

git config --global core.autocrlf false
cd ~ || exit 1
mkdir .ssh
chmod 700 .ssh
apt install python3 python3-pip ipython3
apt install shellcheck
#### feel free to install latex, if you are going to be taking comp theory
# apt install texlive-latex-recommended texlive-metapost texlive-fonts-recommended
# t install vim-gtk
curl https://cli-assets.heroku.com/install.sh | sh
apt install build-essential
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
apt update && apt dist-upgrade -y
printf "---------------------
It is suggested you run these commands with your
username once this script has finished:
cd .ssh || exit 1
cp /mnt/c/Users/{insert your username here}/.ssh/id_rsa* .
chmod 600 id_rsa
chmod 644 id_rsa.pub
---------------------"
printf "After running the above suggested commands,
Please copy your rsa key and paste it to
your github's authorized keys using this command:
cat ~/.ssh/id_rsa.pub
---------------------"
apt install zsh -y
printf "if [ -t 1 ] ; then
exec zsh
fi" >> ~/.bashrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y
