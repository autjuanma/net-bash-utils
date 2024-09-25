#!/bin/bash
source config.sh

# Set the clone directory
CLONE_DIR="/home/autmarisella/.[code]/.users/juansitoAUT/"

# Loop through the repositories and clone them
for repo in $(gh repo list --json name | jq -r '.[] | .name'); do
  echo "Cloning $repo..."
  gh repo clone "$OWNER_NAME/$repo" "$CLONE_DIR/$repo"
done