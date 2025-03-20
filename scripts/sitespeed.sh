#!/bin/bash

# Set the timezone
timezone="Asia/Bangkok"

# Check if list.txt exists
if [[ ! -f list.txt ]]; then
  echo "Error: list.txt not found!"
  exit 1
fi

# Read URLs from list.txt and run sitespeed.io via Docker
while IFS= read -r url; do
  # Ensure the URL is not empty
  if [[ -n "$url" ]]; then
    echo "Running sitespeed.io for $url"
    # Execute the Docker command with the specified timezone and mount the current directory
    docker run -e TZ=$timezone --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io "$url"
  fi
done < list.txt
