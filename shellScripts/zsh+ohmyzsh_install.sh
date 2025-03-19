#!/bin/bash
# Install zsh and oh-my-zsh

# Update package list and install Zsh
echo -e " -- Updating package list... --\n"
sudo apt update

echo -e "\n -- Installing Zsh... --\n"
sudo apt install -y zsh

# Change the default shell to Zsh
echo -e "\n -- Changing default shell to Zsh... --\n"
chsh -s $(which zsh)

# Install Oh My Zsh
echo -e "\n -- Installing Oh My Zsh... \n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&

# Optional: Install a theme (e.g., Powerlevel10k)
#echo -e " -- Installing Powerlevel10k theme... --\n"
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k

# Set the theme in .zshrc
#echo -e " -- Setting Powerlevel10k as the theme in .zshrc... --\n"
#sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc

# Inform the user
echo "--- Zsh and Oh My Zsh have been installed successfully! ---" &&
echo "=  Please log out and log back in to start using Zsh.  ="

# To check if the default shell was set correctly
echo $SHELL
# you should get: /usr/bin/zsh

