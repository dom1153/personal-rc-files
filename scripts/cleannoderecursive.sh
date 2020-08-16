#!/bin/bash

# arr=(`find . -type d`)

curdir="`pwd`"
dir="$PWD"
echo "Calculating current size..."
oldsz="`du -sh | cut -f1`"

# i == directory under current
arr=`find . -name node_modules -type d`
for i in $arr; do
  fullpath="$dir/$i"
  if [ -d "$fullpath" ]; then
    echo "SCRIPT: entering $fullpath/../"
    cd "$fullpath/../"
    echo "SCRIPT:   PWD is now $PWD"
    rm -rf node_modules 2>/dev/null
    rm -rf .cache 2>/dev/null
    rm -f package-lock.json yarn.lock yarn-error.log 2>/dev/null
    if [ -f $fullpath/clean.sh ]; then
      echo "SCRIPT: Running 'clean.sh found in $fullpath"; ./clean.sh 2>/dev/null
    fi
  else
    echo "Skipping $fullpath, path no longer exists"
  fi
done

cd $curdir
echo "Calculating new size..."
cleansz="`du -sh | cut -f1`"
echo "Cleaning done! $oldsz -> $cleansz"
