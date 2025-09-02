#!/bin/bash

URL="https://anthropobio.uliege.be/?tab=home"

if [[ "$OSTYPE" == "darwin"* ]]; then
    BROWSER="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v google-chrome >/dev/null 2>&1; then
        BROWSER="google-chrome"
    elif command -v chromium-browser >/dev/null 2>&1; then
        BROWSER="chromium-browser"
    elif command -v chromium >/dev/null 2>&1; then
        BROWSER="chromium"
    elif [ -f "/usr/bin/google-chrome" ]; then
        BROWSER="/usr/bin/google-chrome"
    elif [ -f "/usr/bin/chromium-browser" ]; then
        BROWSER="/usr/bin/chromium-browser"
    elif [ -f "/usr/bin/chromium" ]; then
        BROWSER="/usr/bin/chromium"
    else
        echo "Chrome/Chromium not found in common Linux locations"
        exit 1
    fi
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

if [[ "$OSTYPE" == "darwin"* ]] && [ ! -f "$BROWSER" ]; then
    echo "Chrome not found at $BROWSER"
    exit 1
fi

echo "Starting Chrome in kiosk mode"
"$BROWSER" --new-window -kiosk --disable-features=TranslateUI --disable-extensions --disable-plugins "$URL" &

exit