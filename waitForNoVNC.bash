#!/bin/bash

echo -n "Waiting for noVNC server to start ... "
while ! netstat -tna | grep 'LISTEN\>' | grep -q ':6901\>'; do
  sleep 1
done
echo "noVNC Server has started."