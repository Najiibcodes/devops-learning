#!/bin/bash

# Navigate into arena
cd Arena

#Check if Hero.txt exists
if [ -e "hero.txt" ]; then

echo "Hero exists!" 
else
echo "Hero missing!"
fi

