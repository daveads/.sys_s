#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script with root privileges (e.g., using 'sudo')."
  exit 1
fi

# Check if the system is running Arch Linux
if [ -f "/etc/os-release" ] && grep -q '^ID=arch' /etc/os-release; then
  # Run the pacman command to list all installed packages and save it to a file
  pacman -Q > installed_packages_archlinux.txt
  echo "List of installed packages saved to 'installed_packages_archlinux.txt'."
elif [ -f "/etc/os-release" ] && grep -q '^ID=ubuntu' /etc/os-release; then
  # Run the dpkg command to list all installed packages and save it to a file
  dpkg --get-selections > installed_packages_ubuntu.txt
  echo "List of installed packages saved to 'installed_packages_ubuntu.txt'."
else
  echo "Unsupported operating system. This script is for Arch Linux and Ubuntu only."
fi

