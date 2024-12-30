#!/bin/bash

REPO_URL="https://github.com/SmoothCloudEU/smoothcloud"

API_URL="https://api.github.com/repos/SmoothCloudEU/smoothcloud/releases/latest"
START_SCRIPT_URL="https://github.com/SmoothCloudEU/smoothcloud-manifest/raw/refs/heads/master/start.sh"

LAUNCHER_DOWNLOAD_URL=$(curl -s $API_URL | jq -r '.assets[] | select(.name | endswith(".jar")) | .browser_download_url')
START_SCRIPT_URL=$(curl -s $START_SCRIPT_URL)

if [ -z "$LAUNCHER_DOWNLOAD_URL" ]; then
  echo "Jar file can't be found!"
  exit 1
fi

echo "Downloading the launcher file..."
curl -L -o "smoothcloud-launcher.jar" $LAUNCHER_DOWNLOAD_URL
echo "Downloaded the launcher file."

if [ -z "$START_SCRIPT_URL" ]; then
  echo "Script file can't be found!"
  exit 1
fi

echo "Downloading the start script file..."
curl -L -o "start.sh" $START_SCRIPT_URL
echo "Downloaded the start script file."

echo "Done."
