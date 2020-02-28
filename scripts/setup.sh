#!/bin/bash

case `uname` in
  MSYS_NT-10.0)
    echo "Warning: Windows seem to handle 'ln -s' as a copy"
    # exit
  ;;
esac

wd="`dirname $PWD/$0`/../"
dotfiles=(.alias .bash_profile .perforcealias .vimrc .zshrc .gitconfig)
for d in ${dotfiles[*]}
do
  echo "ln -s "$wd/$d" ~/"
  ln -s "$wd/$d" ~/
done
echo "SCRIPT: Done!"
