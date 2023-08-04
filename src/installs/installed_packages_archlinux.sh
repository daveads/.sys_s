#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script with root privileges (e.g., using 'sudo')."
  exit 1
fi

# Check if the system is running Arch Linux
if [ -f "/etc/os-release" ] && grep -q '^ID=arch' /etc/os-release; then
  # Check if the installed_packages_archlinux.txt file exists
  if [ -f "installed_packages_archlinux.txt" ]; then
    # Read the package names from installed_packages_archlinux.txt and install them using pacman
    echo "Installing packages from installed_packages_archlinux.txt..."
    pacman -S --noconfirm - < installed_packages_archlinux.txt
    echo "Package installation completed."
  else
    echo "installed_packages_archlinux.txt not found. Please make sure the file exists and contains the list of packages to install."
  fi
else
  echo "This script is for Arch Linux only. Unsupported operating system."
fi
