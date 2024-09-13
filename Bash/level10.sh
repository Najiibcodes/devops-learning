#!/bin/bash

# Step 1: Create Arena_Boss directory
mkdir Arena_Boss

# Step 2: Create 5 text files inside Arena_Boss, named file1.txt to file5.txt
for i in {1..5}; do
    touch Arena_Boss/file$i.txt
done

# Step 3: Generate random number of lines (between 10 and 20) in each file
for file in Arena_Boss/*.txt; do
    lines=$((10 + RANDOM % 11))  # Generate random number between 10 and 20
    for ((i=0; i<$lines; i++)); do
        echo "This is line $((i+1)) in $file" >> "$file"
    done
done

# Step 4: Sort files by their size and display the list
echo "Files in Arena_Boss sorted by size:"
find Arena_Boss -type f -exec ls -lh {} + | sort -k 5 -h

# Step 5: Check if any of the files contain the word 'Victory' and move them to Victory_Archive
mkdir -p Victory_Archive
for file in Arena_Boss/*.txt; do
    if grep -q "Victory" "$file"; then
        mv "$file" Victory_Archive/
        echo "$file contains 'Victory' and has been moved to Victory_Archive"
    fi
done
