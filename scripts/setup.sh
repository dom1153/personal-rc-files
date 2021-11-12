#!/bin/bash

# README:
# Assumes dot files are directory above

case $(uname) in
  MSYS_NT-10.0)
    echo "ERROR: Windows seem to handle 'ln -s' as a copy. Use mklink instead"
    exit
  ;;
esac

expectedRCFolder='personal-rc-files'
addArgs=""
for arg in "$@"
do
    case $arg in
        "-f" )
           addArgs+="-f ";;
   esac
done

# consider moving this to .config/dotfiles someday

# cd to script path
# https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
wd="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $wd/..
# https://stackoverflow.com/questions/1371261/get-current-directory-name-without-full-path-in-a-bash-script
rcfolder=${PWD##*/}
if [ "$rcfolder" != "$expectedRCFolder" ]
then
  echo "SCRIPT: Could not find folder '$expectedRCFolder' (expected to be above script location)"
  exit
fi
dotfiles=(.alias .alias-perforce .alias-windows .alias-local .alacritty.yml .bash_profile .bash.pathsettings .zshrc .gitconfig .tmux.conf .vimrc .vimrc.pluginsettings)
for d in ${dotfiles[*]}
do
  if [ ! -f $d ] 
  then
    echo "SCRIPT: Could not fild file $d"
  else
  cmd="ln -s $addArgs $PWD/$d $HOME"
  echo SCRIPT: $cmd
  $cmd
  fi
done

function tryGitConfig() {
  if [ -f "$1" ]; then
    cmd="ln -s $addArgs $PWD/$2 $HOME/$localGitFile"
    echo SCRIPT: $cmd
    $cmd
  fi
}

# setup os specific (gh include)
localGitFile=".gitconfig-local"
case $(uname) in
  Darwin)
    tryGitConfig "/opt/homebrew/bin/gh" ".gitconfig-mac-m1"
    tryGitConfig "/usr/local/bin/gh" ".gitconfig-mac-intel"
    ;;
  Linux)
    tryGitConfig "/usr/bin/gh" ".gitconfig-linux"
esac

echo "SCRIPT: Done!"
