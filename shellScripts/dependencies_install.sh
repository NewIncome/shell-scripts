#!/bin/bash
# Install main basic dependencies

# 1- Install 'wget', 'curl', and 'git'
if sudo apt-get install wget curl snap git
then
  echo -e "\n -- Installed dependencies correctly(wget, curl, snap, and git)! --\n"
else
  echo "\n -- Error installing dependencies --\n"
  exit
fi

# 2- Install Opera browser
if sudo snap install opera
then
  echo -e "\n -- Installed Opera correctly! --\n"
else
  echo "\n -- Error installing Opera --\n"
  exit
fi

