#!/usr/bin/zsh

if [ ! -n "~/bin" ]
then
  mkdir ~/bin
fi

link_exist() {
  if [ -h $1 ]
  then
    return 0
  fi
  return 1
}

if git --version
then
  echo "git installed."
else
  echo "Installing git..."
  sudo apt-get install -y git
fi

if zsh --version
then
  echo "zsh installed."
else
  echo "Installing zsh..."
  sudo apt-get install -y zsh
  chsh -s `which zsh`
fi

if which lolcat
then
  echo "lolcat installed"
else
  gem install --user-install lolcat
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

if which fortune
then
  echo "fortune installed."
else
  echo "Installing fortune..."
  sudo apt-get install -y fortune
fi

if ag --version
then
  echo "ag installed."
else
  echo "Installing ag..."
  git clone https://github.com/ggreer/the_silver_searcher
  sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
  cd the_silver_searcher
  ./build.sh
  AG=~/bin/ag
  if link_exist $AG; then rm $AG; fi
  ln -s `pwd`/ag ~/bin/ag
  rehash
  cd ..
fi

echo "Installing fortune prompt..."
FPROMPT=~/bin/fortune-prompt.sh
if link_exist $FPROMPT; then rm $FPROMPT; fi
ln -s `pwd`/bin/fortune-prompt.sh $FPROMPT

echo "Installing zshrc..."
ZSHRC=~/.zshrc
if link_exist $ZSHRC; then rm $ZSHRC; fi
ln -s `pwd`/zshrc $ZSHRC

echo "Installing gitconfig..."
GITCFG=~/.gitconfig
if link_exist $GITCFG; then rm $GITCFG; fi
ln -s  `pwd`/gitconfig $GITCFG

echo "Done."

