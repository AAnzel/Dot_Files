#!/bin/bash

# The master bash script for setting up a freshly installed system


# 0.0: updating system
echo
echo "================= Updating system ================="
sudo apt update
sudo apt full-upgrade -y


# 1.0: installing all of the programs
echo
echo "================= Installing programs ================="
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt install -y vlc qbittorrent fastfetch conky-all rclone keepassxc ruby-full ruby-devel libyaml-devel imagemagick optipng sassc inkscape curl
sudo gem install bundler
flatpak install --noninteractive -y flathub com.viber.Viber com.skype.Client org.signal.Signal com.vscodium.codium 

# 1.1: installing Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# 1.2: Installing Mullvad
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
sudo apt update
sudo apt install mullvad-vpn

# 2.0: copying configuration files
echo
echo "================= Copying configuration files ================="
cp to_do_list.txt ~/Documents/
cp -r conky_configs/ ~/.config/
cp conky.desktop ~/.config/autostart/

# Adding .bashrc entry
echo -e '\n############# Added by Aleksandar ##############\nexport PS1="\[$(tput bold)\]\[\033[38;5;39m\]\u\[$(tput sgr0)\]@\h | \[$(tput bold)\]\d\[$(tput sgr0)\] | \[$(tput bold)\]\t\[$(tput sgr0)\] \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\n[\w] \\$ \[$(tput sgr0)\]"\n###################################################\n' >> ~/.bashrc


# 3.0: installing Miniconda and packages
echo
echo "================= Installing Miniconda ================="
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

echo
echo "================= Installing Miniconda and pip packages ================="
conda update --all -y
conda install -y numpy pandas scikit-learn
conda install -y -c conda-forge jupyterlab pipreqs plotly
conda update --all -y
conda clean --all -y
conda update --all -y
conda clean --all -y

# 4.0: Git config
echo
echo "================= Git config =============="
git config --global user.name "AAnzel"
git config --global user.email "44969003+AAnzel@users.noreply.github.com"

# 5.0: manual work
echo
echo "================= To do ================="
cd ~/
echo "1. Configure rclone."
echo "2. Create and add new SSH key to GitHub, Azure, etc."
echo "3. Sync VSCodium configs."
