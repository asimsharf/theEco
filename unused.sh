#!/bin/bash

# Get the current directory path
current_dir="$(pwd)"

# Change to the directory of the script
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# Remove any trailing slashes from current_dir
current_dir="${current_dir%/}"

unused_files=()
counter=0

# Find all Dart files in the lib directory
while IFS= read -r -d $'\0' file; do
    filename=$(basename "$file")

    # Check if the file is [main.dart] or [app.dart] and skip it
    if [ "$filename" = "main.dart" ] || [ "$filename" = "app.dart" ]; then
        continue
    fi

    if ! grep -qrn --exclude="$filename" "$filename" lib; then
        counter=$((counter + 1))
        echo "$counter- $current_dir$file"
        unused_files+=("$file")
    fi
done < <(find lib -name '*.dart' -print0)