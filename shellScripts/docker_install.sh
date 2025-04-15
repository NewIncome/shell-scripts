#!/bin/bash

# This script will fully install Docker Desktop on Ubuntu.

# Step 1: Update the package index
echo "  -- Updating package index..."; echo
sudo apt-get update -y

# Step 2: Set up KVM device user permissions
echo; echo "  -- Please make sure you do have Virtualization enabled in your bios before running Docker"
echo " \"You can run: modprobe kvm_intel<or _amd>\""; echo

# - Add your user to the kvm group
echo "  -- Adding user to kvm group"; echo
sudo usermod -aG kvm $USER

# Step 3: Install gnome-terminal to enable terminal access from Docker Desktop, if not running Gnome
echo "  -- Installing gnome-terminal..."; echo
if sudo apt install gnome-terminal
then
  echo -e "\n -- Installed gnome-terminal correctly! --\n"
else
  echo "\n -- Error installing gnome-terminal --\n"
  exit
fi

# Step 4: Install Docker dependencies
echo "  -- Installing Docker dependencies..."; echo
sudo apt install -y ca-certificates curl gnupg lsb-release &&
sudo mkdir -p /etc/apt/keyrings &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
if [ $? -eq 0 ]; then
  echo -e "\n -- Installed Docker dependencies correctly! --\n"
else
  echo "\n -- Error installing Docker dependencies --\n"
  exit
fi

# Step 5: Download Docker Desktop
echo "  -- Downloading Docker Desktop..."; echo
if curl -L -o ~/Downloads/docker-desktop-amd64.deb https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb
then
  echo -e "\n -- Downloaded Docker Desktop correctly! --\n"
else
  echo "\n -- Error downloading Docker Desktop --\n"
  exit
fi


# Step 6: Install Docker Desktop
echo "  -- Installing Docker Desktop..."; echo
sudo apt-get install -y ~/Downloads/docker-desktop-amd64.deb
if [ $? -eq 0 ]; then
  echo -e "\n -- Installed Docker Desktop correctly! --\n"
else
  echo "\n -- Error installing Docker Desktop --\n"
  exit
fi

echo "  -- Done installing Docker Desktop successfully ---"; echo
echo "  Alternatively you can launch Docker Desktop from the terminal with the following command:"
echo "  systemctl --user start docker-desktop"; echo

# Additional Step: Checking packages were installed correctly
echo "  -- Version checking:"
docker compose version &&
docker --version &&
docker version

