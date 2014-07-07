#!/usr/bin/zsh

if git --version
then
  echo "git installed."
else
  echo "Installing git..."
  sudo apt-get install -y git
fi

if zsh -v
then
  echo "zsh installed."
else
  echo "Installing zsh..."
  sudo apt-get install -y zsh
  chsh -s `which zsh`
fi

if [ ! -n "$ZSH" ]
then
  ZSH=~/.oh-my-zsh
fi
if [ -d "$ZSH" ]
then
  echo "Oh-my-zsh installed."
else
  echo "Cloning Oh My Zsh..."
  git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
fi

if which cowsay
then
  echo "cowsay installed."
else
  echo "Installing cowsay..."
  sudo apt-get install -y cowsay
fi

if ag --version
then
  echo "ag installed."
else
  echo "Installing ag..."
  git clone https://github.com/ggreer/the_silver_searcher
  sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
  cd the_silver_searcher
  make -j8
  ln -s ag ~/bin/ag
  cd ..
fi

echo "Installing fortune prompt..."
ln -s bin/fortune-prompt.sh ~/bin/fortune-prompt.sh
echo "Installing zshrc..."
ln -s zshrc ~/.zshrc
echo "Installing gitconfig..."
ln -s  gitconfig ~/.gitconfig

echo "Done."

