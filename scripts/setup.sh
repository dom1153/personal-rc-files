#!/bin/sh

case `uname` in
  MSYS_NT-10.0)
    echo "Warning: Windows seem to handle 'ln -s' as a copy"
    # exit
  ;;
esac

wd="`dirname $0`/../"
dotfiles=(.alias .bash_profile .perforcealias .vimrc .zshrc)
for d in ${dotfiles[*]}
do
  echo "ln -s "$wd/$d" ~/"
  ln -s "$wd/$d" ~/
done
echo "SCRIPT: Done!"
