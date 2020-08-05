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

sudo apt install -y sassc meson libglib2.0-dev inkscape optipng vlc qbittorrent gnome-tweaks steam neofetch conky rclone
sudo flatpak install -y viber

# 1.1: installing Vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt install -y vivaldi-stable


# 2.0: copying configuration files
sudo cp to_do_list.txt ~/Documents/
sudo cp -r .conky_configs ~

echo
echo "================= Running neofetch so it can create config folder ================="
neofetch

sudo cp neofetch/config.conf ~/.config/neofetch/


# 3.0: changing theme
echo
echo "================= Changing theme ================="
git clone https://github.com/AAnzel/Pop_OS_custom_theme
cd Pop_OS_custom_theme
sudo sh pop-color-change.sh
cd ..


# 4.0: manual work
echo
echo "================= To do ================="
echo "Add to .bashrc: neofetch --ascii_colors 1 8"
echo "Add conky script to start-up programs"
echo "Configure rclone"

