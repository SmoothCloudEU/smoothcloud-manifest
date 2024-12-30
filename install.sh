#!/bin/bash

REPO_URL="https://github.com/SmoothCloudEU/smoothcloud"

API_URL="https://api.github.com/repos/SmoothCloudEU/smoothcloud/releases/latest"

DOWNLOAD_URL=$(curl -s $API_URL | jq -r '.assets[] | select(.name | endswith(".zip")) | .browser_download_url')

if [ -z "$DOWNLOAD_URL" ]; then
  echo "Zip file can't be found!"
  exit 1
fi

echo "Downloading zip file..."
curl -L -o "release.zip" $DOWNLOAD_URL

echo "Unzipping zip file..."
unzip -q release.zip

echo "Removing zip file..."
rm release.zip

echo "Done."
