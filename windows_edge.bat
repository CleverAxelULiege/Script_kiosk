@echo off


set URL=https://anthropobio.uliege.be/?tab=home

set BROWSER="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

start "" %BROWSER% --new-window -kiosk %URL%

exit