#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run the script with root privileges (e.g., using 'sudo')."
  exit 1
fi

# Check if the system is running Ubuntu
if [ -f "/etc/os-release" ] && grep -q '^ID=ubuntu' /etc/os-release; then
  # Check if the installed_packages_ubuntu.txt file exists
  if [ -f "installed_packages_ubuntu.txt" ]; then
    # Read the package names from installed_packages_ubuntu.txt and install them using apt
    echo "Installing packages from installed_packages_ubuntu.txt..."
    xargs -a installed_packages_ubuntu.txt apt -y install
    echo "Package installation completed."
  else
    echo "installed_packages_ubuntu.txt not found. Please make sure the file exists and contains the list of packages to install."
  fi
else
  echo "This script is for Ubuntu only. Unsupported operating system."
fi

