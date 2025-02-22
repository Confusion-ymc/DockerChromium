#!/bin/bash

export USER=nobody

# 设置默认屏幕尺寸
SCREEN_SIZE=${SCREEN_SIZE:-1024x768x24}

# 检查是否传入 VNC 密码
if [ -n "$VNCPASS" ]; then
    # 设置 VNC 密码
    x11vnc -storepasswd "$VNCPASS" /root/.vnc/passwd
    VNC_PASSWORD_PARAM="-usepw"
else
    VNC_PASSWORD_PARAM=""
fi


# Create data directory
mkdir -p /data
# Create first run file
touch '/data/First Run'
# Remove chrome profile lock file
rm -rf /data/Singleton*

# Start supervisord and services
supervisord -c /supervisord.conf
