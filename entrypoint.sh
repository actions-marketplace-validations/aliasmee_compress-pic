#!/bin/sh

# Add strict errors.
set -eu

# Variables.
#PIC_PATH="$GITHUB_WORKSPACE/$INPUT_PIC_PATH"
#COMP_LEVEL="$INPUT_COMPRESS_LEVEL" 

# Compress pic
for file in `find $GITHUB_WORKSPACE/$INPUT_PIC_PATH -regex '.*\.png\|.*\.jpg'`; do 
    fileType=`file -i $file  | awk '{print substr($2, 1, length($2)-1)}'| cut -d'/' -f2`;
    if [[ $fileType == "png" ]]; then
        optipng -o $INPUT_COMP_LEVEL $file;
    elif [[ $fileType == "jpeg" ]]; then
        jpegoptim $file; 
    fi;
done
