#!/bin/bash

# Check if a configuration file is provided
if [ -z "$1" ]; then
  echo "Usage: ./level12.sh <config_file>"
  exit 1
fi

config_file=$1

# Check if the provided file exists
if [ ! -f "$config_file" ]; then
  echo "Error: Configuration file '$config_file' not found!"
  exit 1
fi

# Read each line of the configuration file
while IFS='=' read -r key value; do
  # Print the key-value pair if both key and value are set
  if [ -n "$key" ] && [ -n "$value" ]; then
    echo "Key: $key, Value: $value"
  fi
done < "$config_file"
