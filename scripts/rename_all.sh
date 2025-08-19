#!/bin/bash


if [ $# -eq 0 ]; then
    regex=".*/[A-Z]\{2,5\}_\?[0-9]\{4\}\.jpg"
elif [ $# -eq 1 ]; then
    regex="$1"
else
    echo "$0: Incorrect number of arguments"
    exit 42
fi

find . -regextype grep -iregex "$regex"
read  -n 1 -p "Continue?" inp
find . -regextype grep -iregex "$regex" -print0 | xargs -0 -n 1 rename.sh
