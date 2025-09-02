@echo off


set URL=https://anthropobio.uliege.be/?tab=home

set BROWSER="C:\Program Files\Google\Chrome\Application\chrome.exe"

start "" %BROWSER% --new-window -kiosk %URL% 

exit