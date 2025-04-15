# Main script to install at the same time:
# + VIM & plugin configs
# + ZSH & oh-my-zsh
# + ...all 4 now
echo -e "--- START of configed Vim, ZSH, and DockerDesktop install ---\n"

# Step 1: First check if basic dependencies are installed 'wget', 'curl', and 'git' are installed
./dependencies_install.sh &&

# Step 2: Install VIM and configs
./vim+plugins_install.sh
if [ $? -eq 0 ]; then
  echo -e "\n -- Finished correctly with VIM and configs! ---\n"
else
  echo -e "\n -- Error installing or configuring VIM --\n"
  exit
fi

# Step 3: Install ZSH and oh-my-zsh
./zsh+ohmyzsh_install.sh
if [ $? -eq 0 ]; then
  echo -e "\n -- Finished correctly installing ZSH and Oh-my-zsh! ---\n"
else
  echo -e "\n -- Error installing ZSH and/or Oh-my-zsh --\n"
  exit
fi

# Step 4: Install Docker Desktop
./docker_install.sh
if [ $? -eq 0 ]; then
  echo -e "\n -- Finished correctly installing Docker Desktop! ---\n"
else
  echo -e "\n -- Error installing Docker Desktop --\n"
  exit
fi

echo; echo --- END of all installations and configurations ---
echo

