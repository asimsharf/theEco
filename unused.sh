#!/bin/bash

# Change to the directory of the script
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# Find all Dart files in the lib directory
find lib/ -name '*.dart' -print0 | while IFS= read -r -d $'\0' file; do
    filename=$(basename "$file")
    if ! grep -qrn --exclude="$filename" "$filename" lib/; then
        echo "Unused file: $file"
    fi
done
