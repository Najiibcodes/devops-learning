#!/bin/bash

# Check if both source directory and backup directory are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: ./level13.sh <source_directory> <backup_directory>"
  exit 1
fi

source_directory=$1
backup_directory=$2

# Create backup directory if it doesn't exist
mkdir -p "$backup_directory"

# Generate a timestamp for the backup
timestamp=$(date +"%Y%m%d%H%M%S")

# Create a backup with a timestamp
backup_name="backup_$timestamp.tar.gz"
tar -czf "$backup_directory/$backup_name" -C "$source_directory" .

# Keep only the last 5 backups, delete older ones
cd "$backup_directory" || exit
backups_count=$(ls -1t backup_*.tar.gz | wc -l)

if [ "$backups_count" -gt 5 ]; then
  echo "Deleting old backups..."
  ls -1t backup_*.tar.gz | tail -n +6 | xargs rm -f
fi

echo "Backup completed: $backup_name"
