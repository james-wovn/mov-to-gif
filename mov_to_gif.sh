#!/bin/bash

echo "Convert .mov files to .gif files"

files=( "$MOV_FILE_PATH"/*.mov )

if (( ${#files[*]} ))
then
    for file in "${files[@]}"
    do
        echo "Converting $(basename "$file" .mov)..."

        # Encode the .mov file to a .gif file
        ffmpeg -i "$file" -pix_fmt rgb8 -r 10 "$GIF_FILE_PATH"/"$(basename "$file" .mov)".gif && \
        # Optimise the .gif file
        gifsicle --optimize=3 "$GIF_FILE_PATH"/"$(basename "$file" .mov)".gif --output "$GIF_FILE_PATH"/"$(basename "$file" .mov)".gif && \

        # Remove the .mov file
        rm "$file"
    done
else
    "No .mov files found"
fi