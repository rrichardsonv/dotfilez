#!/bin/bash

FOLDER=~/dotfilez

# dotfiles
cd      "$FOLDER"
ln -sf  "$FOLDER"/vimrc         ~/.vimrc
ln -sf  "$FOLDER"/bashrc        ~/.bashrc
ln -sf  "$FOLDER"/bash_profile  ~/.bash_profile
ln -sf  "$FOLDER"/tmuxconf      ~/.tmux.conf
ln -sf  "$FOLDER"/gemrc         ~/.gemrc
ln -sf  "$FOLDER"/irbrc         ~/.irbrc
ln -sf  "$FOLDER"/inputrc       ~/.inputrc
ln -sf  "$FOLDER"/gitconfig     ~/.gitconfig
ln -sf  "$FOLDER"/rspec         ~/.rspec

echo    "Setup symlinks"

./osx/set-defaults

