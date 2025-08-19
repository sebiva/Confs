#!/bin/bash
set -e
set -x

if [ "$#" -eq 3 ]; then
    find "$1" -iname "*.jpg" -printf "%P\n" > "$3/a.txt"
    find "$2" -iname "*.jpg" -printf "%P\n" > "$3/b.txt"
    set +e
    diff "$3/a.txt" "$3/b.txt" > "$3/diff.txt"
    set -e
    mkdir "$3/only-in-a"
    mkdir "$3/only-in-b"
    cat "$3/diff.txt" | grep "^<" | cut -d ' ' -f2- |xargs -d '\n' -I img mv "$1/"img "$3/only-in-a/"
    cat "$3/diff.txt" | grep "^>" | cut -d ' ' -f2- |xargs -d '\n' -I img mv "$2/"img "$3/only-in-b/"
    ret=$?
    set +e
    rmdir "$3/only-in-a" &> /dev/null
    rmdir "$3/only-in-b" &> /dev/null
    num=$(wc -l <(cat "$3/diff.txt"|tail -n +2) | awk '{print $1}')
    echo "Number of differing files: $num"
    exit $ret
else
    echo "Usage: diff-dirs.sh <path-a> <path-b> <path-out>"
    exit 42
fi


