#!/bin/bash
FILENAME=${1:-bandcamp.txt}
filename=$FILENAME
n=1
while read line; do

BASE=${line:8}
ARTIST=${BASE%.bandcamp*}
SELECTED=${line##*/}

echo "[$n - $ARTIST : $SELECTED - start]"

./bandcamp-dl --full-album --base-dir=$HOME/Music ${line}

echo "[$n - $ARTIST : $SELECTED - finished]"

n=$((n+1))
done < $filename
