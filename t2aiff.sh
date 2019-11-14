#!/bin/bash
for filename in Data/*.txt; do
        Say -v Fred -o "Data/$(basename "$filename" .txt).aiff" -f "$filename"
done