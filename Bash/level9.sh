#!/bin/bash

# Set the directory to be monitored
DIR="."

# Log file to store changes
LOGFILE="directory_changes.log"

# Function to get the current timestamp
timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

# Monitor changes in the directory
while true; do
  # Get the list of all files and their modification times
  find "$DIR" -type f -printf '%T+ %p\n' > current_snapshot.txt
  
  # Check if a previous snapshot exists
  if [ -f previous_snapshot.txt ]; then
    # Compare the current snapshot with the previous one
    changes=$(diff previous_snapshot.txt current_snapshot.txt)
    
    # If there are changes, log them with a timestamp
    if [ "$changes" ]; then
      echo "$(timestamp) - Changes detected:" >> "$LOGFILE"
      echo "$changes" >> "$LOGFILE"
      echo "-----------------------------------------" >> "$LOGFILE"
    fi
  fi
  
  # Update the previous snapshot to the current one
  mv current_snapshot.txt previous_snapshot.txt
  
  # Wait for 10 seconds before checking again
  sleep 10
done
