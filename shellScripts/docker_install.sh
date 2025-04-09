#!/bin/bash

# This script will fully install Docker Desktop on Ubuntu.

# Step 1: Update the package index
echo "  -- Updating package index..."; echo
sudo apt-get update -y

# Step 2: Set up KVM device user permissions
echo "  -- Please make sure you do have Virtualization enabled in your bios before running Docker"; echo
echo "  -- You can run: modprobe kvm_intel<or _amd>"; echo

# - Add your user to the kvm group
echo "  -- Adding user to kvm group"; echo
sudo usermod -aG kvm $USER

# Step 3: Install gnome-terminal to enable terminal access from Docker Desktop, if not running Gnome
echo "  -- Installing gnome-terminal..."; echo
sudo apt install gnome-terminal

# Step 4: Download Docker Desktop
echo "  -- Downloading Docker Desktop..."; echo
curl -L -o ~/Downloads/docker-desktop-amd64.deb https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb


# Step 5: Install Docker Desktop
echo "  -- Installing Docker Desktop..."; echo
sudo apt-get install -y ~/Downloads/docker-desktop-amd64.deb

echo "  -- Done installing Docker Desktop successfully ---"; echo
echo "  Alternatively you can launch Docker Desktop from the terminal with the following command:"
echo "  systemctl --user start docker-desktop"; echo

# Additional Step: Checking packages were installed correctly
echo "  -- Version checking:"
docker compose version &&
docker --version &&
docker version

