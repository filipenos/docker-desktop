#!/bin/bash

# configure vnc
mkdir -p $HOME/.vnc && echo "$VNC_PASSWD" | vncpasswd -f > $HOME/.vnc/passwd
vncserver :0 -localhost no -nolisten -rfbauth $HOME/.vnc/passwd

# start web client
/opt/noVNC/utils/novnc_proxy &

# disable vpn prompt
vncconfig -nowin &

# set resolution
xrandr --size $DISPLAY_SIZE --display :0

# block script to docker running
tail -f /dev/null