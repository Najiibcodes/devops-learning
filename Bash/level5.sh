#!/bin/bash

#Create battlefield directory
mkdir -p Battlefield

#Create the 3 files inside battlefield 
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rouge.txt

#Create archive directory 
mkdir -p Archive

#Check if knight.txt exists + move it to archive if it does
if [ -e "Battlefield/knight.txt" ]; then
mv Battlefield/knight.txt Archive/
echo "knight.txt has been moved to archive"
else
echo "knight.txt not found in battlefield"
fi

#List the contents of both battlefield and archive
echo "contents of battlefield:"
ls battlefield

echo "contents of archive:"
ls archive