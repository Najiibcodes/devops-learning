#!/bin/bash

# Specify the directory and threshold
directory=$1   # Accepts the directory as the first argument
threshold=$2   # Accepts the threshold percentage as the second argument

# Check if both arguments are provided
if [ -z "$directory" ] || [ -z "$threshold" ]; then
  echo "Usage: ./level11.sh <directory_path> <threshold_percentage>"
  exit 1
fi

# Get the disk usage of the directory
disk_usage=$(du -s "$directory" | awk '{print $1}')
# Get the total disk space usage as a percentage
total_space=$(df "$directory" | grep -Eo '[0-9]+%' | head -1 | tr -d '%')

# Check if disk usage exceeds threshold
if [ "$total_space" -gt "$threshold" ]; then
  echo "Alert: Disk usage of $directory is ${total_space}% which exceeds the threshold of ${threshold}%"
else
  echo "Disk usage of $directory is under control: ${total_space}%"
fi
