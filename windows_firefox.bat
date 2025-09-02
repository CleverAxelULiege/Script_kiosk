@echo off


set URL=https://anthropobio.uliege.be/?tab=home

set BROWSER="C:\Program Files\Mozilla Firefox\firefox.exe"

start "" %BROWSER% --new-window -kiosk %URL%

exit