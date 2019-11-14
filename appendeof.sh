#!/bin/bash
for filename in Data/*.txt; do
        cat "$filename" "eof.txt">"Out/$(basename "$filename" .txt)-eof.txt"
done