#!/bin/bash

# Define the owner name
OWNER_NAME="juansitoAUT"

# Loop through the repositories and clone them
for repo in $(gh repo list --json name | jq -r '.[] | .name'); do
  echo "Cloning $repo..."
  gh repo clone "$OWNER_NAME/$repo"
done