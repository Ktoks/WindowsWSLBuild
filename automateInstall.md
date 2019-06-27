```
This script is for Dixie State University CS students
to get get their systems set up for each class that I have
taken in the department.

First and foremost, I installed Debian, I chose Debian over Ubuntu
because I felt it was necissary to learn about Debian. I have only 
used a few different Linux distros and I want to broaden my horizons.
```

> Click search bar and type
Windows Powershell

> Click "Run as Administrator"

> Input the following commands and press enter:
```
Get-AppxPackage Microsoft-Windows-Subsystem-Linux | Install-AppxPackage
```

> Once it has finished running those commands input the following
```
Invoke-WebRequest `
    -Uri "https://aka.ms/wsl-debian" `
    -OutFile "~Debian.appx" `
    -UseBasicParsing ;
```

> Or maybe try this one:
```
Add-AppxPackage `
    -Path "~Debian.appx" ;
```

> Configure your new UNIX username and password

> To run the windows subsystem for linux inside Powershell:
wsl

#############################################################

> This step is to allow sudo-ing:
```
su
apt-get install sudo
adduser {yourusername}
usermod -aG sudo {yourusername}
su {yourusername}
```

> On Debian update and upgrade to most current versions:
```
sudo apt-get update
sudo apt-get upgrade -y
sudo apt dist-upgrade -y
```
> if above steps didn't work, user setup wasn't successful

> To install Go:
```
sudo apt-get install golang-go
```

###########################################################################

> To set your GoRoot and GoPath up:
```
sudo echo "export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=\$GOPATH/bin:#GOROOT/BIN:\$PATH" >> ~/.bashrc
```

> To set your GoPath up:
```
sudo vim ~/.bashrc
```
> Add this to .bashrc on the bottom
```
# Go Global Variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:#GOROOT/BIN:$PATH
```
> To save and exit Vim:
Hit escape and enter:
```
:wq
```

#################################################################

> To make your changes available now:
```
source ~/.bashrc
```

> How I set up git:
> First check for installation
```
git --version
```
> If not installed:
```
sudo apt install git
```
> Setup for use with your profile:
```
git config --global user.name "{yourUsername}"
git config --global user.email "{youremail@email.com}"
```
> Configure autoline endings to be off -(prevents possible hidden issues)
```
git config --global core.autocrlf false
```

> I set up an ssh key pair to match my Windows one:
> Go to home dir:
```
cd ~
```
> Make your SSH directory:
```
mkdir .ssh
```
> Change its access:
```
chmod 700 .ssh
```
> Go to SSH directory:
```
cd .ssh
```
> copy your ssh keys to Linux:
```
cp /mnt/c/Users/{yourUsername}/.ssh/id_rsa* .
```
> Change their access:
```
chmod 600 id_rsa
chmod 644 id_rsa.pub
```

> Copy your public ssh key to github.com:
```
cat ~/.ssh/id_rsa.pub
```
> Copy and paste this key and paste it into your authorized keys on github, bitbucket, and/or remote servers

> Install Shellcheck for bash scripting:
```
apt-get install shellcheck
```

> Installing Python 3:
```
sudo apt install python3 python3-pip ipython3
```

> Install aima-python for AI class:
```
git clone https://github.com/aimacode/aima-python.git
pip install -r requirements.txt
cd aima-python
git submodule init
git submodule update
```
> Install Pytest
```
pip install pytest
```

> Install zsh:
```
sudo apt-get install zsh -y
```

> Install Oh My Zsh:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

> Setup zsh:
```
sudo vim ~/.bashrc
```
> input:
```
if [ -t 1 ] ; then
exec zsh
fi
```
> Save and quit.

> Install vim gtk2 gui 8.0.
```
sudo apt-get install vim-gtk
```

######## Comp Theory

```
sudo apt-get install texlive-latex-recommended texlive-metapost texlive-fonts-recommended -y
```

############# Web Stuff ##########

> Install Heroku:
```
sudo curl https://cli-assets.heroku.com/install.sh | sh
```

> Install NPM:
```
sudo apt-get install build-essential
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
```
> Restart terminal and run:
```
nvm install stable
```
> Command to use when using node per project:
```
nvm use stable
```

> Install Vue:
```
npm install vue
```
> command to use when using vue locally:


Optional: I ran the following script int powershell to turn off programs that 
Windows runs in the background:
```
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
