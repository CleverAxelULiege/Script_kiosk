#!/bin/bash

URL="https://anthropobio.uliege.be/?tab=home"

if [[ "$OSTYPE" == "darwin"* ]]; then
    BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v firefox >/dev/null 2>&1; then
        BROWSER="firefox"
    elif [ -f "/usr/bin/firefox" ]; then
        BROWSER="/usr/bin/firefox"
    elif [ -f "/usr/local/bin/firefox" ]; then
        BROWSER="/usr/local/bin/firefox"
    else
        echo "Firefox not found in common Linux locations"
        exit 1
    fi
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

if [[ "$OSTYPE" == "darwin"* ]] && [ ! -f "$BROWSER" ]; then
    echo "Firefox not found at $BROWSER"
    exit 1
fi

echo "Starting Firefox in kiosk mode"
"$BROWSER" --new-window -kiosk "$URL" &

exit