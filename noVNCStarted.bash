#!/bin/bash

CODESPACE_NAME=$(jq -r '.CODESPACE_NAME' < /workspaces/.codespaces/shared/environment-variables.json)
echo "Codespace name is: $CODESPACE_NAME"

