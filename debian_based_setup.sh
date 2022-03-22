#!/bin/bash

# Initial installations.
sudo apt update
sudo apt install \
     ca-certificates \
     curl \
     gnupg \
     lsb-release \
     python3-pip \
     sqlite3 \
     snapd

# Donwload and install ipython.
pip install ipython

# Download Chrome browser.
wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=$(dpkg --print-architecture)] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list

# Download Docker.
sudo apt remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install everything that was downloaded up to this point.
sudo apt update
sudo apt install \
     google-chrome-stable \
     docker-ce docker-ce-cli containerd.io \
     zsh

# Install oh-my-zsh. THIS WILL CAUSE A MAJOR OVERHAULING IN HOW YOUR TERMINAL WORKS.
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
