#!/bin/bash
#
DOWNLOAD_URL=$(curl -s https://api.github.com/repos/logseq/logseq/releases/latest \
    | grep url \
    | grep AppImage \
    | cut -d '"' -f 4)
echo Download URL $DOWNLOAD_URL
FILE_NAME=$(curl -s https://api.github.com/repos/logseq/logseq/releases/latest \
    | grep url \
    | grep AppImage \
    | cut -d '/' -f 9)

AFILE_NAME=${FILE_NAME::-1}

echo $FILE_NAME
echo $AFILE_NAME

wget $DOWNLOAD_URL
