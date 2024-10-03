#!/bin/bash
# Thur October 03 07:22:00 IST 2024$

# variables
BASE="/mnt/c/Users/Sushant/OneDrive/Desktop/HTML"
DAYS=10
DEPTH=1
RUN=0

# check if the directory is present or not
if [ ! -d $BASE ]
then
        echo "directory does not exist: $BASE"
        exit 1

fi

# create 'archieve' folder if not present
if [ ! -d $BASE/archive ]
then
        mkdir $BASE/archive

fi


# find the list of files larger than 5MB
for i in $(find "$BASE" -maxdepth $DEPTH -type f -size +1M); do
    if [ $RUN -eq 0 ]; then
        gzip "$i" || exit 1
        mv "$i.gz" "$BASE/archive" || exit 1
    fi
done
