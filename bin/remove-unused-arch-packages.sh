#!/bin/bash

# According to:
# https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Removing_unused_packages

deps=$(pacman -Qtdq)

if [ -n "$deps" ]; then
  sudo pacman -Rns $deps
else
  echo "No unused packages found."
fi
