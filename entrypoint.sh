#!/bin/bash

WINDOW_SIZE=${WINDOW_SIZE:-1600x900}
BROWSER_SIZE=$(echo "$WINDOW_SIZE" | sed 's/x/,/')

if [ -n "$VNC_PASS" ]; then
    x11vnc -storepasswd "$VNC_PASS" /root/.vnc/passwd
    VNC_PASSWORD_PARAM="-rfbauth /root/.vnc/passwd"
else
    VNC_PASSWORD_PARAM=""
fi

CONFIG_FILE_CONTENT="[supervisord]
nodaemon=true

[program:xvfb]
command=Xvfb :0 -screen 0 ${WINDOW_SIZE}x24 -listen tcp -ac
autorestart=true

[program:websockify]
command=websockify --web /usr/share/novnc 6080 localhost:5900
autorestart=true

[program:x11vnc]
command=x11vnc -forever -shared ${VNC_PASSWORD_PARAM}
autorestart=true

[program:chromium]
command=chromium --no-sandbox --remote-debugging-port=9223 --user-data-dir=/data --window-size=${BROWSER_SIZE}
autorestart=true

[program:socat]
command=socat tcp-listen:9222,fork tcp:localhost:9223
autorestart=true"

echo "$CONFIG_FILE_CONTENT" > supervisord.conf

echo "set WINDOW_SIZE: $WINDOW_SIZE"
if [ -n "$VNC_PASS" ]; then
    echo "set vnc password success"
else
    echo "not set vnc password"
fi
echo "supervisord.conf created"

# Create data directory
mkdir -p /data
touch '/data/First Run'
rm -rf /data/Singleton*

# Start supervisord and services
supervisord -c /supervisord.conf
