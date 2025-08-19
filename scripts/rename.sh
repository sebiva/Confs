#!/bin/bash

if [ $# -eq 1 ]; then
    echo "Renaming $1"
    exiftool "-FileName<CreateDate" -d "IMG_%Y%m%d_%H%M%S_%%f.jpg" "$1"
    # When the full CreateDate is not available
    #read  -n 1 -p "Continue with reduced info?" inp
    #exiftool "-FileName<DateTimeOriginal" -d "IMG_%Y%m%d_%%f.jpg" "$1"
else
    echo "$0: Incorrect number of arguments"
    exit 42
fi
