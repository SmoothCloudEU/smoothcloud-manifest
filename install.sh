#!/bin/bash

REPO_URL="https://github.com/SmoothCloudEU/smoothcloud"
API_URL="https://api.github.com/repos/SmoothCloudEU/smoothcloud/releases/latest"
START_SCRIPT_URL="https://github.com/SmoothCloudEU/smoothcloud-manifest/raw/refs/heads/master/start.sh"

# Find the URL of the launcher JAR file
LAUNCHER_DOWNLOAD_URL=$(curl -s $API_URL | jq -r '.assets[] | select(.name | endswith(".jar")) | .browser_download_url')

# Check if the launcher JAR URL exists
if [ -z "$LAUNCHER_DOWNLOAD_URL" ]; then
  echo "Jar file can't be found!"
  exit 1
fi

echo "Downloading the launcher file..."
curl -L -o "smoothcloud-launcher.jar" $LAUNCHER_DOWNLOAD_URL
echo "Launcher file downloaded."

# Download the start script and save it
echo "Downloading the start script..."
curl -L -o "start.sh" $START_SCRIPT_URL
echo "Start script downloaded."

echo "Done."
