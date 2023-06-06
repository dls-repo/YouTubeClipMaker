#!/bin/bash

# Accept URL from user
read -p "Enter the video URL: " URL

# Accept starting time from user
read -p "Enter the starting time (format - HH:MM:SS): " START_TIME

# Accept clip duration from user
read -p "Enter the duration of the clip (format - HH:MM:SS): " DURATION

# Download the entire video
yt-dlp -f mp4 -o original $URL

# Find YouTube video title
TITLE=$(yt-dlp --get-filename -o '%(title)s' "$URL")

# Use ffmpeg to clip and copy into new file
ffmpeg -i original -ss $START_TIME -t $DURATION -c copy "$TITLE.mp4"

# Delete original
rm original

echo "Video clip saved successfully!"
