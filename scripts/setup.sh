#!/bin/sh

case `uname` in
  MSYS_NT-10.0)
    echo "Warning: Windows seem to handle 'ln -s' as a copy"
    # exit
  ;;
esac

wd="`dirname $0`/../"
dotfiles=(.alias .bash_profile .perforcealias .vimrc)
for d in ${arr[*]}
do
  echo "$d"
done
# cd ~
#if [[ -f "$FILE" ]]; then
  #ln -s $wd/.alias ~/
#endif
#if [[ -f "$FILE" ]]; then
#ln -s $wd/.bash_profile ~/
#endif
#ln -s $wd/.gitconfig ~/
#ln -s $wd/.perforcealias ~/
#ln -s $wd/.vimrc ~/
#echo "SCRIPT: Done!"
#cd -
