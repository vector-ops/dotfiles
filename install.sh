#! /bin/bash

sudo dnf update
sudo dnf upgrade

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y zsh zsh-autosuggestions zsh-syntax-highlighting zoxide wget unzip gcc clang fastfetch mpv make python3-pip unrar cargo p7zip p7zip-plugins ntfs-3g htop ffmpeg poppler jq rg resvg ImageMagick fzf helix

sudo dnf copr enable -y lihaohong/yazi
sudo dnf install -y yazi


curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin



curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
