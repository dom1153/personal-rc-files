#!/bin/bash

# README:
# consider using -f to check personal-rc-files or better
# run from the personal-rc-files folder, not your home directory!

case `uname` in
  MSYS_NT-10.0)
    echo "ERROR: Windows seem to handle 'ln -s' as a copy. Use mklink instead"
    exit
  ;;
esac

wd="`dirname $PWD/$0`/../"
dotfiles=(.alias .alias-perforce .alias=windows .alias-local .bash_profile .gitconfig .tmux.conf .vimrc .vimrc.pluginsettings .zshrc)
for d in ${dotfiles[*]}
do
  # consider using pwd of script then do .. and check appropriate files
  echo "ln -s "$wd/$d" ~/"
  # consider using ln -f
  ln -s "$wd/$d" ~/
done
echo "SCRIPT: Done!"
