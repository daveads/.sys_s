#!/usr/bin/env bash

# Function to check if the script is run with root privileges
check_root_privileges() {
  if [ "$EUID" -ne 0 ]; then
    echo "Please run the script with root privileges (e.g., using 'sudo')."
    exit 1
  fi
}

# Function to check if the system is running Arch Linux
is_arch_linux() {
  [ -f "/etc/os-release" ] && grep -q '^ID=arch' /etc/os-release
}

# Function to check if the system is running Ubuntu
is_ubuntu() {
  [ -f "/etc/os-release" ] && grep -q '^ID=ubuntu' /etc/os-release
}

# Main script starts here
check_root_privileges

if is_arch_linux; then
  # Run the install_packages_archlinux.sh script if the system is Arch Linux
  if [ -f "install_packages_archlinux.sh" ]; then
    echo "Running install_packages_archlinux.sh..."
    chmod +x install_packages_archlinux.sh
    ./install_packages_archlinux.sh
  else
    echo "install_packages_archlinux.sh not found. Please make sure the file exists."
  fi
elif is_ubuntu; then
  # Run the install_packages_ubuntu.sh script if the system is Ubuntu
  if [ -f "install_packages_ubuntu.sh" ]; then
    echo "Running install_packages_ubuntu.sh..."
    chmod +x install_packages_ubuntu.sh
    ./install_packages_ubuntu.sh
  else
    echo "install_packages_ubuntu.sh not found. Please make sure the file exists."
  fi
else
  echo "Unsupported operating system. This script is for Arch Linux and Ubuntu only."
fi

