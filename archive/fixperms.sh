#!/bin/sh

#echo "Arg: ${0}, ${1}"
find ${1} -type d -exec chmod 755 {} +
find ${1} -type f -exec chmod 644 {} +
