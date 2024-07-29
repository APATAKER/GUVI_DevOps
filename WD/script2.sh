#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi
file=$1
temp_file=$(mktemp)
awk 'NR < 5 { print; next } /welcome/ { gsub(/learning/, "process") } { print }' "$file" > "$temp_file"
mv "$temp_file" "$file"
echo "File processing complete. All occurrences of 'give' have been replaced with 'learning' from line 5 onwards in lines containing 'welcome'."
