#!/bin/bash

# The master bash script for setting up a freshly installed system



# 0.0: installing package manager
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 0.1: updating system
echo
echo "================= Updating system ================="
brew tap homebrew/cask
brew tap homebrew/bundle
brew update -v


# 1.0: installing all of the programs
echo
echo "================= Installing programs ================="
brew bundle

# 1.1: installing Docker
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#echo \
#  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#sudo apt update
#sudo apt install -y docker-ce docker-ce-cli containerd.io

# 2.0: copying configuration files
echo
echo "================= Copying configuration files ================="
cp to_do_list.txt ~/Documents/
cp -r neofetch/ alacritty/ ~/.config/

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Adding .bashrc entry
echo -e '\n############# Added by Aleksandar ##############\nneofetch\n bindkey "^R" history-incremental-search-backward\n###################################################\n' >> ~/.bashrc


# 3.0: installing Miniconda and packages
echo
echo "================= Installing Miniconda ================="
mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

echo
echo "================= Installing Miniconda and pip packages ================="
conda update --all -y
conda install -y numpy pandas keras scikit-learn gensim
conda install -y -c conda-forge altair jupyterlab biopython pipreqs plotly
conda update --all -y
conda clean --all -y
conda update --all -y
conda clean --all -y
#pip install streamlit

# 4.0: Git config
echo
echo "================= Git config =============="
git config --global user.name "AAnzel"
git config --global user.email "44969003+AAnzel@users.noreply.github.com"

# 5.0: manual work
echo
echo "================= To do ================="
cd ~/
echo "1. Create and add new SSH key to GitHub, Azure, etc."
echo "2. Sync VSCodium configs."
