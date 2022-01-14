#!/bin/sh


if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


ln -sf $(pwd)/.vimrc $HOME/.vimrc
ln -sf $(pwd)/.vimrc.plugins $HOME/.vimrc.plugins

pip3 install --user pynvim
