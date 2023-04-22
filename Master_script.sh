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
sudo apt install -y vlc qbittorrent gnome-tweaks neofetch conky rclone keepassxc ruby-full imagemagick mpv cava btop optipng sassc inkscape
sudo gem install bundler
flatpak install --noninteractive -y flathub com.viber.Viber com.skype.Client org.signal.Signal com.vscodium.codium 

# 1.1: installing Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# 2.0: copying configuration files
echo
echo "================= Copying configuration files ================="
cp to_do_list.txt ~/Documents/
cp -r neofetch/ alacritty/ conky_configs/ cava/ ~/.config/

# Adding .bashrc entry
echo -e '\n############# Added by Aleksandar ##############\nneofetch\nexport PS1="\[$(tput bold)\]\[\033[38;5;39m\]\u\[$(tput sgr0)\]@\h \[$(tput bold)\]\t\[$(tput sgr0)\] \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\n[\w] \\$ \[$(tput sgr0)\]"\n###################################################\n' >> ~/.bashrc


# 3.0: installing Miniconda and packages
echo
echo "================= Installing Miniconda ================="
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh
source ~/.bashrc
rm miniconda.sh

echo
echo "================= Installing Miniconda and pip packages ================="
conda update --all -y
conda install -y numpy pandas keras scikit-learn gensim
conda install -y -c conda-forge altair jupyterlab biopython pipreqs plotly
conda update --all -y
conda clean --all -y
conda update --all -y
conda clean --all -y
pip install streamlit

# 4.0: changing theme
#echo
#echo "================= Changing theme ================="
#git clone https://github.com/AAnzel/Pop_OS_custom_theme
#cd Pop_OS_custom_theme/
#sudo sh pop-color-change.sh
# sudo sh pop-shell-ext-change.sh
#cd ../
#sudo rm -r Pop_OS_custom_theme/

# 4.0: Git config
echo
echo "================= Git config =============="
git config --global user.name "AAnzel"
git config --global user.email "44969003+AAnzel@users.noreply.github.com"

# 5.0: manual work
echo
echo "================= To do ================="
cd ~/
echo "1. Add conky script to start-up programs."
echo "2. Configure rclone."
echo "3. Sync Firefox."
echo "4. Create and add new SSH key to GitHub, Azure, etc."
echo "5. Sync VSCodium configs."
