#!/bin/bash

######
# install some stuffs
# ###

### cli :
# list of tool : tldr, nmap, dirb, ffuf, crackmapexec, vim, gdb, gef, docker, git, poetry, awesome, xxd, exiftool, wine, yara, nikto, hashcat, gcc, binwalk autopsy, evil-winrm, netcat, ncat, nc, binwalk, unzip
#
### interface :
# list of tool : burpsuite, ida, ghidra, wireshark, bloodhound
echo "[*] Updating the client ..."
sudo dnf update -y
echo -en "[*] Done.\n[*] Installing some stuffs...\n"

sudo dnf install python3-pip gem tldr nmap ffuf vim gdb docker git poetry awesome xxd wine yara nikto hashcat gcc binwalk netcat nc binwalk unzip neovim ltrace strace net-tools iproute -wireshark-qt -y 

echo "[*] Installing crackmapexec..."
python3 -m pip install pipx
pipx ensurepath
pipx install crackmapexec

echo "[*] Done..."

echo "[*] Installing exiftool ..."
sudo git clone https://github.com/exiftool/exiftool.git /opt/exiftool
echo -e '\nexport PATH=/opt/exiftool:$PATH' >> ~/.bashrc

echo "[*] Installing evil-winrm..."
sudo gem install evil-winrm

echo "[*] Done..."

echo "[*] Installing gef..."
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
echo "[*] Done..."


echo "[*] Downloading burpuiste, ida, ghidra, wireshark, bloodhound..."
wget 'https://portswigger-cdn.net/burp/releases/download?product=community&version=2023.9.4&type=Linux' --output-document "$HOME"/Downloads/burpsuite-2023.sh
wget 'https://out7.hex-rays.com/files/idafree83_linux.run' --output-document "$HOME"/Downloads/idafree83_linux.run
sudo usermod -a -G wireshark x86
echo "[*] Done"
######
# get the repos
####
echo "[*] Installing the repos..."
mkdir -p "$HOME"/Documents/Tools/
unzip zipped_repos.zip "$HOME"/Documents/Tools/ 2>&1 >/dev/null 

#####
# get the wordlists
##
echo "[*] Adding wordlists..."
mkdir -p /usr/share/
sudo unzip wordlists.zip -d /usr/share/

