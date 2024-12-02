#!/bin/bash

CODESPACE_NAME=$(jq -r '.CODESPACE_NAME' < /workspaces/.codespaces/shared/environment-variables.json)
echo "Codespace name is: $CODESPACE_NAME"

NOVNC_URL="$CODESPACE_NAME-6901.app.github.dev"
echo "noVNC URL is: $NOVNC_URL"