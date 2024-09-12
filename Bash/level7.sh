#!/bin/bash

find . -type f -name "*.txt" -exec ls -lh {} + | awk '{ print $5, $9 }' | sort -h
