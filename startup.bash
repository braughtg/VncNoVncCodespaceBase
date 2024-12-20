#!/bin/bash

# Cleanup from past vnc session that may hav been running in the container.
rm /tmp/.X11-unix/X1
rm /tmp/.X1-lock

# Launch the VNC server
vncserver \
  -localhost no \
  -geometry 1024x768 -depth 16 \
  -SecurityTypes None --I-KNOW-THIS-IS-INSECURE

# Launch the noVNC server.
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6901 &

# Check if the .contconf/launch.bash script exists and if it does
# then run it here.  This allows images that use this as a base
# to insert a script that will run on startup.
if [ -f /home/student/.contconf/launch.bash ];
then
  echo "Running launch.bash"
  source /home/student/.contconf/launch.bash
fi

sleep infinity
