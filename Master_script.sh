#!/bin/bash

# The master bash script for setting up a freshly installed system


# 0.0: updating system
echo
echo "================= Updating system ================="
sudo apt update
sudo apt full-upgrade


# 1.0: installing all of the programs
echo
echo "================= Installing programs ================="
sudo apt install -y sassc meson libglib2.0-dev inkscape optipng vlc qbittorrent gnome-tweaks steam neofetch conky rclone ghostwriter keepassxc
sudo flatpak install -y viber

# 1.1: installing Vivaldi
# wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
# sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
# sudo apt update && sudo apt install -y vivaldi-stable


# 2.0: copying configuration files
cp to_do_list.txt ~/Documents/
cp -r .conky_configs ~/

echo
echo "================= Configuring neofetch ================="
mkdir -p ~/.config/neofetch/
cp neofetch/config.conf ~/.config/neofetch/

# Adding .bashrc entry
echo -e '\n############# JA DODAJEM ZA NEOFETCH ##############\nneofetch --ascii_colors 1 \n###################################################\n' >> ~/.bashrc


# 3.0: installing Miniconda and packages
echo
echo "================= Installing Miniconda ================="
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
source .bashrc

echo
echo "================= Installing Miniconda packages ================="
conda update --all -y
conda install -y numpy pandas keras scikit-learn
conda install -y -c conda-forge altair jupyterlab biopython
conda update --all -y
conda clean --all -y
conda update --all -y
conda clean --all -y

# 4.0: changing theme
#echo
#echo "================= Changing theme ================="
#git clone https://github.com/AAnzel/Pop_OS_custom_theme
#cd Pop_OS_custom_theme/
#sudo sh pop-color-change.sh
# sudo sh pop-shell-ext-change.sh
#cd ../
#sudo rm -r Pop_OS_custom_theme/


# 4.0: manual work
echo
echo "================= To do ================="
cd ~/
echo "1. Add conky script to start-up programs"
echo "2. Configure rclone"
echo "3. Apply Flat-Remix shell and gtk themes"
echo "4. Install Ublock Origin, Dark Reader, Gnome Integration, Grammarly, Translate, ..."
echo "5. Install deb packages of Skype and Signal (possible automation)"
