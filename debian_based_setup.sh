# Initial installations.
sudo apt-get install \
     ca-certificates \
     curl \
     gnupg \
     lsb-release \
     python3-pip \
     sqlite3

# Donwload and install ipython.
pip install ipython


# Download sublime text editor.
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Download Chrome browser.
wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=$(dpkg --print-architecture)] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list

# Download Docker.
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Download beekeeper studio. This is a freaking awesome database editor. As of the time of writing this file, they only have keys and not gpg pubs.
# wget -qO - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
# echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list

# Install everything that was downloaded up to this point.
sudo apt-get update
sudo apt-get install \
     sublime-text \
     google-chrome-stable \
     docker-ce docker-ce-cli containerd.io \
     zsh \
     # beekeeper-studio

# Install oh-my-zsh. THIS WILL CAUSE A MAJOR OVERHAULING IN HOW YOUR TERMINAL WORKS.
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"