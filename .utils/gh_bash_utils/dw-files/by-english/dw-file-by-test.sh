#!/bin/bash

# Set the base URL
BASE_URL="PUT-YOUR-URL"

# Get the list of episode files
EPISODE_FILES=($(wget -q -O - "$BASE_URL" | grep -o 'href=[\'"]?([^\'" >]*)' | sed -e 's/^.*href="\([^"]*\)".*$/\1/'))

# Loop through each episode file
for EPISODE_FILE in "${EPISODE_FILES[@]}"; do
  if [ -n "$EPISODE_FILE" ]; then
    # Extract the episode title from the file name
    EPISODE_TITLE="$(basename -- "$EPISODE_FILE" | sed -e 's/_download.*$//')"

    # Create a local folder for the episode
    mkdir -p "$EPISODE_TITLE"

    # Download the MP3 and PDF files
    wget -q "${BASE_URL}/${EPISODE_FILE}_download.mp3" -P "$EPISODE_TITLE"
    wget -q "${BASE_URL}/${EPISODE_FILE}.pdf" -P "$EPISODE_TITLE"
  fi
done