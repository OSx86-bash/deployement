#!/bin/bash

# Check if the script is being run as an admin (root or sudo)
if [ "$EUID" -ne 0 ]; then
  echo "This script requires administrator privileges. Please run it as root or using sudo."
  exit 1


echo "[*] Setting local time"
timedatectl set-local-rtc 1 --adjust-system-clock

echo "[*] Preparing the grub"
dnf install grub-customizer -y

echo -en "[*] Now, modify the entry GRUB_ENABLE_BLSCFG in /etc/default/grub "

read _blank
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

echo "[*] Now, go to grub customizer and move the windows boot manager entry to the top "

read _blank

echo "[*] Done"
