#!/bin/bash

#Check if arguments is provided
if [ -z "$1" ]; then
echo "No file provided"
else

#Check if the file exists
if [ -f "$1" ]; then

#Print the number of lines in the file
echo "Number of lines in $1: $(wc -1 < "$1")"
else
echo "File not Found!"
fi
fi
