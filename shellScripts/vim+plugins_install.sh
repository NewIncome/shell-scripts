# Install VIM + customConfig + ZSH + OhMyZsh

# 1- Install VIM
if sudo apt install vim
then
  echo -e "\n -- Installed VIM correctly! --\n"
else
  echo "\n -- Error installing VIM --\n"
  exit
fi

# 2- Add custom config file ~/.vimrc with customizations
if `wget -P ~/ https://raw.githubusercontent.com/NewIncome/Code-Notes/refs/heads/main/Various/CustomizedVimNzshFiles/.vimrc`
then
  echo -e "\n -- Got .vimrc file correctly! --\n"
else
  echo -e "\n -- Error getting .vimrc file --\n"
  exit
fi

# 3- Install Vim plug-in manager
if `sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
then
  echo -e "\n -- Installed vim PlugIn Manager correctly! --\n"
else
  echo -e "\n -- Error installing vim PlugIn Manager --\n"
  exit
fi

# 4- get the dir and files for the config and PlugIns
if mkdir ~/vimplug-plugins && `wget -P ~/ https://raw.githubusercontent.com/NewIncome/Code-Notes/refs/heads/main/Various/CustomizedVimNzshFiles/.vimrc.plug`
then
  echo -e "\n -- Got .vimrc.plug file, and made dir correctly! --\n"
else
  echo -e "\n -- Error making plugin dir, or getting .vimrc.plug file --\n"
fi

# 5- Change permissions for .vim dir, before plugin installations
if `sudo chmod -R 0755 ~/.vim/`
then
  echo -e "\n -- Changed .vim dir permissions correctly! --\n"
else
  echo -e "\n -- Error changing .vim dir permissions --\n"
  exit
fi

# 6- Install vim PlugIns
vim -c 'PlugInstall' -c 'qa'
if [ $? -eq 0 ]; then   
  echo -e "\n -- Plugins for vim installed correctly! --\n"
else
  echo -e "\n -- Error installing Plugins for vim --\n"
fi

