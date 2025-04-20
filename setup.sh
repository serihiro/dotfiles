#! /bin/bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global

PLATFORM=`uname`
if [ "${PLATFORM}" = "Darwin" ];then
  if [ ! -d /usr/local/Cellar/zplug ];then
    echo "installing zplug..."
    brew install zplug
    source /opt/homebrew/opt/zplug/init.zsh
  fi
elif [ "${PLATFORM}" = "Linux" ];then
  if [ ! -d ~/.zplug ];then
    echo "installing zplug..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi
fi

if [ ! -d ~/.vim ];then
  echo "installing pathogen..."
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [ ! -d ~/.vim/bundle/molokai ];then
  echo "installing molokai..."
  cd ~/.vim/bundle
  git clone https://github.com/tomasr/molokai.git
fi

