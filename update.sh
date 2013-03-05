#!/bin/sh

set -e

if [ $# -eq 0 ]; then
  echo "No tag supplied. Usage: ./update.sh master"
  exit 1
fi

TAG=$1
EXTRACT_DIRECTORY="$$$(date "+%Y%m%d%H%M%S")"
FILE_NAME="$EXTRACT_DIRECTORY.tar.gz"
RELEASE_URL="https://github.com/designmodo/Flat-UI/archive/$TAG.tar.gz"
RELEASE_PATH="$EXTRACT_DIRECTORY/flat-ui-$TAG"
VENDOR_PATH="vendor/assets"

wget -O $FILE_NAME $RELEASE_URL
mkdir $EXTRACT_DIRECTORY
tar xfz $FILE_NAME -C $EXTRACT_DIRECTORY

cp "$RELEASE_PATH/css/flat-ui.css" "$VENDOR_PATH/stylesheets"
cp -R "$RELEASE_PATH/images" $VENDOR_PATH

