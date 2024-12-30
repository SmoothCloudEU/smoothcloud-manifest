@echo off

set REPO_URL=https://github.com/SmoothCloudEU/smoothcloud
set API_URL=https://api.github.com/repos/SmoothCloudEU/smoothcloud/releases/latest
set START_SCRIPT_URL=https://github.com/SmoothCloudEU/smoothcloud-manifest/raw/refs/heads/master/scripts/start.bat

rem Find the URL of the launcher JAR file
for /f "tokens=*" %%a in ('curl -s %API_URL% ^| findstr /r /c:"\"browser_download_url\": \".*\.jar\""') do (
    set LAUNCHER_DOWNLOAD_URL=%%a
)

rem Extract the URL
set LAUNCHER_DOWNLOAD_URL=%LAUNCHER_DOWNLOAD_URL:"browser_download_url": =%
set LAUNCHER_DOWNLOAD_URL=%LAUNCHER_DOWNLOAD_URL:"=%

rem Check if the launcher JAR URL exists
if "%LAUNCHER_DOWNLOAD_URL%"=="" (
    echo Jar file can't be found!
    exit /b 1
)

echo Downloading the launcher file...
curl -L -o smoothcloud-launcher.jar %LAUNCHER_DOWNLOAD_URL%
echo Launcher file downloaded.

rem Download the start script (start.bat) and save it
echo Downloading the start script...
curl -L -o start.bat %START_SCRIPT_URL%
echo Start script downloaded.

del install.bat

echo Done.
