# Automated Install Script For WSL On Windows

## This script is for Dixie State University CS students to get get their systems set up for each class that I have taken in the department

First and foremost, choose the linux distribution that has everything you need. I chose debian for this install script.

> Click search bar and type
__Windows Powershell__
> Click "Run as Administrator"
> Input the following commands and press enter:

```powershell
Get-AppxPackage Microsoft-Windows-Subsystem-Linux | Install-AppxPackage
```

> Once it has finished running those commands input the following

```powershell
Invoke-WebRequest `
    -Uri "https://aka.ms/wsl-debian" `
    -OutFile "~Debian.appx" `
    -UseBasicParsing ;
```

> Or maybe try this one:

```powershell
Add-AppxPackage `
    -Path "~Debian.appx" ;
```

> Configure your new UNIX username and password
> To run the windows subsystem for linux inside Powershell:

```powershell
wsl
```

#############################################################

## Bash Setup

> This step is to allow sudo-ing:

```bash
su
apt install sudo
adduser {yourusername}
usermod -aG sudo {yourusername}
su {yourusername}
```

> On Debian update and upgrade to most current versions:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
```

> if above steps didn't work, user setup wasn't successful

###########################################################################

## Set up Go for Distributed Systems

```bash
sudo apt-get install golang-go
```

> Set GoPATH automatically:

```bash
sudo echo "export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=\$GOPATH/bin:#GOROOT/BIN:\$PATH" >> ~/.bashrc
```

> Set GoPATH manually:

```bash
sudo vim ~/.bashrc
```

> Add this to .bashrc on the bottom

```vim
# Go Global Variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:#GOROOT/BIN:$PATH
```

> To save and exit Vim:
Hit escape and type:

```vim
:wq
```

#################################################################

> To make your changes available now:

```bash
source ~/.bashrc
```

## Set Up Git

> First check for installation

```bash
git --version
```

> If not installed:

```bash
sudo apt install git
```

> git setup for use with your profile:

```bash
git config --global user.name "{yourUsername}"
git config --global user.email "{youremail@email.com}"
```

> Configure autoline endings to be off -(prevents possible windows vs linux issues)

```bash
git config --global core.autocrlf false
```

## Configure SSH

> I made my Linux machine's ssh configuration match my Windows one.
> Go to home dir:

```bash
cd ~
```

> Make your SSH directory:

```bash
mkdir .ssh
```

> Change its access:

```bash
chmod 700 .ssh
```

> Go to SSH directory:

```bash
cd .ssh
```

> copy your ssh keys from Windows to Linux:

```bash
cp /mnt/c/Users/{yourUsername}/.ssh/id_rsa* .
```

> Change their access:

```bash
chmod 600 id_rsa
chmod 644 id_rsa.pub
```

> Copy your public ssh key to github.com:

```bash
cat ~/.ssh/id_rsa.pub
```

> Copy and paste this key and paste it into your authorized keys on github, bitbucket, and/or remote servers

## Shellcheck for bash scripting:

```bash
apt install shellcheck
```

## Python3

> Installing Python 3:

```bash
sudo apt install python3 python3-pip ipython3
```

> Install Pytest

```bash
python3 -m pip install pytest
```

## Make Bash Easier To Use

> Install zsh:

```bash
sudo apt install zsh -y
```

> Install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

> Setup zsh:

```bash
sudo vim ~/.bashrc
```

> input:

```vim
if [ -t 1 ] ; then
exec zsh
fi
```

> Save and quit.

## Install VIM

> Install vim gtk2 gui 8.0.

```bash
sudo apt install vim-gtk
```

## Latex For Comp Theory

```bash
sudo apt install texlive-latex-recommended texlive-metapost texlive-fonts-recommended -y
```

## Heroku, NPM, Vue For Web Apps

> Heroku:

```bash
sudo curl https://cli-assets.heroku.com/install.sh | sh
```

> NPM:

```bash
sudo apt install build-essential
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
```

> Restart terminal and run:

```bash
nvm install stable
```

> Command to use when using node per project:

```bash
nvm use stable
```

> Install Vue:

```bash
npm install vue
```

> command to use when using vue locally:

## Windows optimizations

Optional: I ran the following script int powershell to turn off programs that
Windows runs in the background:

```powershell
Get-AppxPackage 3dbuilder | Remove-AppxPackage
Get-AppxPackage windowsalarms | Remove-AppxPackage
Get-AppxPackage windowscommunicationsapps | Remove-AppxPackage
Get-AppxPackage windowscamera | Remove-AppxPackage
Get-AppxPackage officehub | Remove-AppxPackage
Get-AppxPackage skypeapp | Remove-AppxPackage
Get-AppxPackage getstarted | Remove-AppxPackage
Get-AppxPackage zunemusic | Remove-AppxPackage
Get-AppxPackage windowsmaps | Remove-AppxPackage
Get-AppxPackage solitairecollection | Remove-AppxPackage
Get-AppxPackage bingfinance | Remove-AppxPackage
Get-AppxPackage zunevideo | Remove-AppxPackage
Get-AppxPackage bingnews | Remove-AppxPackage
Get-AppxPackage onenote | Remove-AppxPackage
Get-AppxPackage people | Remove-AppxPackage
Get-AppxPackage windowsphone | Remove-AppxPackage
Get-AppxPackage bingsports | Remove-AppxPackage
Get-AppxPackage bingweather | Remove-AppxPackage
```
