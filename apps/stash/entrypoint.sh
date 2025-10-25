#!/usr/bin/env bash

export USER="stash"

dirs=(
  /config/plugins
  /config/scrapers
)

for dir in "${dirs[@]}"; do
  # Find all requirements.txt files recursively
  find "$dir" -type f -name "requirements.txt" | while read -r reqfile; do
    echo "Installing Python requirements from: $reqfile"
    pip install --target . --no-cache-dir --break-system-packages -r "$reqfile"
  done
done

exec /app/stash "@"