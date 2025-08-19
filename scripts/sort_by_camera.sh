#!/bin/bash

if [ $# -eq 1 ]; then
    exiftool '-directory<$model' -ext jpg -r $1
else
    echo "$0: Incorrect number of arguments"
fi
