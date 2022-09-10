#!/bin/bash
############################################################################################################################################
#  Script     : ubuntusetup.sh
#  Author     : Anurag S Rajawat
#  Date       : 2022/09/12
#  Last Edited: 2022/08/14, Anurag S Rajawat
#  Description: Script to setup fresh ubuntu as per my requirements
############################################################################################################################################

line="========================================================|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||========================================================"
width="\t\t\t\t\t\t\t\t\t\t\t\t"

declare -i task=1

DIR="$HOME/setup"

if [[ ! -e $DIR ]]; then
    mkdir $DIR && cd $DIR
fi

echo "What's your name?"
read name

if [[ -z $name ]]; then
    echo "Sorry, you haven't provide your name! Bye"
    exit
fi

echo -e "\nHello ${name^}! I'm going to setup your ubuntu till then take your coffee and enjoy the show! 😎\n"
echo -e "$line\n"
echo -e "$width Task - $task Update system!\n"
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo apt update && sudo apt upgrade -y
if [[ $? -ne 0 ]]; then exit; else echo -e "\n$width Task - $task is completed\n"; fi
task+=1
# if [[ isFailed ]]; then echo -e "\nAn error occured ❌ Please try again\n"; else echo -e "\nTask - $task is completed\n"; fi

echo -e "$line\n"
echo -e "$width Task - $task Install utilities\n"
sudo apt install -y build-essential curl wget ca-certificates vim git zsh bat neofetch net-tools htop python3-pip gnome-tweaks dconf-editor chrome-gnome-shell \
    ubuntu-restricted-extras tmux tree mpg123 linux-libc-dev gnupg lsb-release apt-transport-https software-properties-common
sudo snap install vlc spotify postman foliate
if [[ $? -ne 0 ]]; then exit; else echo -e "\n$width Task - $task is completed\n"; fi
task+=1

echo -e "$line\n"
echo -e "$width Task - $task Install dev-tools\n"

# Jetbrains Toolbox
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.25.12999.tar.gz
tar -xzf jetbrains* && cd "$(basename jetbrains*)" && chmod +x jetbrains* && ./jetbrains*
rm -rf jetbrains*

# VS-Code
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O code.deb

# Discord & Slack
wget https://discord.com/api/download?platform=linux&format=deb
wget https://downloads.slack-edge.com/releases/linux/4.27.156/prod/x64/slack-desktop-4.27.156-amd64.deb

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install -y brave-browser

# Google-Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install -y ./*.deb
if [[ $? -ne 0 ]]; then exit; else echo -e "\n$width Task - $task is completed\n"; fi
task+=1

echo -e "$line\n"
echo -e "$width Task - $task Install container apps\n"

# Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg.
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Kubectl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install -y kubectl
source <(kubectl completion zsh)

# Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
if [[ $? -ne 0 ]]; then exit; else echo -e "\n$width Task - $task is completed\n"; fi
task+=1


echo -e "$line\n"
echo -e "$width Task - $task Setup Programming-languages\n"
# Java and its build-tools
# JAVA_HOME env need to be set manually
wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
sudo tar -xzf apache-maven-3.8.6-bin.tar.gz -C /opt
sudo mv /opt/apache-maven* maven

wget https://gradle.org/next-steps/?version=7.5.1&format=bin
sudo mkdir /opt/gradle
sudo unzip gradle gradle-7.5.1-bin.zip -d /opt
sudo mv /opt/gradle-* gradle

sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt install -y openjdk-11-jre openjdk-11-jdk
sudo echo "JAVA_HOME=/usr/lib/jvm/default-java" >> /etc/environment

echo "export M2_HOME=/opt/maven
export PATH=\$PATH:\$M2_HOME/bin
export GRADLE_HOME=/opt/gradle
export PATH=\$PATH:\$GRADLE_HOME/bin" >> ~/.zshrc

# Go
wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz

echo "export PATH=\$PATH:/usr/local/go/bin
export GOPATH=\$HOME/go
export PATH=\$PATH:\$GOPATH/bin
export PATH=\$PATH:\$GOPATH/bin:/usr/local/go/bin" >> ~/.zshrc
if [[ $? -ne 0 ]]; then exit; else echo -e "\n$width Task - $task is completed\n"; fi
task+=1

echo -e "$line\n\n$width Adding finishing touches...\n"
sudo apt autoremove -y && sudo apt autoclean -y
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
if [[ $? -ne 0 ]]; then
    exit
else
    cd ../ && rm -rf $DIR
fi

echo -e "$width Congratulations $name! 🎉 Setup successfully completed! 😎"
echo -e "\n\t3...🔔"
sleep 2
echo -e "\n\t2...👹"
sleep 2
echo -e "\n\t1...👽"
sleep 2
echo -e "\n\tBOOM! 💣"
sleep 2
systemctl reboot -i
