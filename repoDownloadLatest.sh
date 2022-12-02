#!/bin/bash


#GITHUB_API=$(curl -s https://api.github.com/repos/logseq/logseq/releases/latest)
#echo $GITHUB_API > api.json
DOWNLOAD_URL=$(cat ./api.json | jq -r '.assets[] | select(.name|match("AppImage$")) | .browser_download_url')
FILE_NAME=$(cat ./api.json | jq -r '.assets[] | select(.name|match("AppImage$")) | .name')
DIR="/home/mheide/Programs"
PROGRAM_NAME='Logseq.AppImage'
echo $DOWNLOAD_URL
echo $FILE_NAME

echo Downloading $FILE_NAME
wget $DOWNLOAD_URL

echo Moving $FILE_NAME to $DIR as $PROGRAM_NAME
mv $FILE_NAME $DIR/$PROGRAM_NAME
echo Making $PROGRAM_NAME executable
chmod +x $DIR/$PROGRAM_NAME
echo DONE!

