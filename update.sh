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
RELEASE_PATH="$EXTRACT_DIRECTORY/Flat-UI-$TAG"
VENDOR_PATH="vendor/assets"

wget -O $FILE_NAME $RELEASE_URL
mkdir $EXTRACT_DIRECTORY
tar xfz $FILE_NAME -C $EXTRACT_DIRECTORY

echo $RELEASE_PATH

cp "$RELEASE_PATH/dist/css/flat-ui.css" "$VENDOR_PATH/stylesheets"
cp "$RELEASE_PATH/dist/css/flat-ui.css.map" "$VENDOR_PATH/stylesheets"

## Sync images 
rm -rf "$VENDOR_PATH/images/*" && cp -r $RELEASE_PATH/dist/img/* "$VENDOR_PATH/images"

## Sync fonts
rm -rf "$VENDOR_PATH/fonts/*" && cp -r $RELEASE_PATH/dist/fonts/* "$VENDOR_PATH/fonts"

## sync javascripts
rm -rf "$VENDOR_PATH/javascripts/*" && cp $RELEASE_PATH/dist/js/flat-ui.js "$VENDOR_PATH/javascripts"



