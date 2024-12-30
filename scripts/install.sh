#!/bin/bash

REPO_URL="https://github.com/SmoothCloudEU/smoothcloud"
API_URL="https://api.github.com/repos/SmoothCloudEU/smoothcloud/releases/latest"
START_SCRIPT_URL="https://github.com/SmoothCloudEU/smoothcloud-manifest/raw/refs/heads/master/scripts/start.sh"

# Find the URL of the launcher JAR file
LAUNCHER_DOWNLOAD_URL=$(wget -qO- $API_URL | grep -o '"browser_download_url": "[^"]*\.jar"' | cut -d '"' -f 4)

# Check if the launcher JAR URL exists
if [ -z "$LAUNCHER_DOWNLOAD_URL" ]; then
  echo "Jar file can't be found!"
  exit 1
fi

echo "Downloading the launcher file..."
wget -O "smoothcloud-launcher.jar" $LAUNCHER_DOWNLOAD_URL
echo "Launcher file downloaded."

# Download the start script and save it
echo "Downloading the start script..."
wget -O "start.sh" $START_SCRIPT_URL
echo "Start script downloaded."

rm install.sh

echo "Done."
