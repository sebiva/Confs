#!/bin/bash

for f in $(find . -regextype posix-egrep -regex './PXL_[0-9]{8}_[0-9]{9}(\~2)?(.[TL]S)?.mp4'); do
    basename="${f%.*}"
    echo "$basename"
    outfile="$basename.lr.mp4"
    ## https://askubuntu.com/questions/923882/reducing-filesize-of-video-in-ubuntu
    ## -n to not overwrite existing output files
    ffmpeg -n -i "$f" -c:v libx264 -preset slow -crf 28 -c:a copy -map_metadata 0 -movflags use_metadata_tags "$outfile"
    ## Command for fixing metadata after the fact, not needed with the metadata flags to ffmpeg present
    ## exiftool -TagsFromFile "$f" "-all:all>all:all" "$outfile"
done
