#!/bin/sh

case `uname` in
  MSYS_NT-10.0)
    echo "Warning: Windows seem to handle 'ln -s' as a copy"
    # exit
  ;;
esac

ln -s .alias ~/
ln -s .bash_profile ~/
ln -s .gitconfig ~/
ln -s .perforcealias ~/
ln -s .vimrc ~/
echo "SCRIPT: Done!"
