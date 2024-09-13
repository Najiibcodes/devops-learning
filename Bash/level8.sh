#!/bin/bash

if [ -z "$1" ]; then
echo "Please provide search term"
exit 1
fi

search_term=$1

for file in *.log; do
if grep -q "$search_term" "$file"; then
echo "$file contains '$search_term'"
fi
done