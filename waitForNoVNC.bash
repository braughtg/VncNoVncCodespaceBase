#!/bin/bash

# Approach used here is from:
# https://stackoverflow.com/questions/68648536/same-line-bash-spinner

spinner() {
  local pid=$!
  spin='-\|/'

  i=0
  while kill -0 $pid 2>/dev/null; do
    i=$(((i + 1) % 4))
    printf "%c" "${spin:$i:1}"
    printf "\b"
    sleep .25
  done
}

echo -n "Waiting for noVNC server to start ... "
(while ! netstat -tna | grep 'LISTEN\>' | grep -q ':6901\>'; do
  sleep 1
 done
) & spinner

echo ""
echo "noVNC Server has started.