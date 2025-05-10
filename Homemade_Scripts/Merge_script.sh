#!/bin/bash

# Base directory containing videos and Subs_dir
BASE_DIR="Video_Directory"

# Directory containing subtitles subdirectories
SUBS_DIR="$BASE_DIR/Subs_Directory"

# Loop over all mp4 files in BASE_DIR
for video in "$BASE_DIR"/*.mp4; do
  # Get base name without extension
  base=$(basename "$video" .mp4)

  # Corresponding subtitle directory inside Subs_dir
  subdir="$SUBS_DIR/$base"

  # Output filename (change suffix or path as needed)
  output="${BASE_DIR}/${base}_merged.mkv"

  # Start building mkvmerge command with the original video
  cmd=(flatpak run org.bunkus.mkvtoolnix-gui mkvmerge -v -o "$output" "$video")

  # Check if the subtitle directory exists
  if [[ -d "$subdir" ]]; then
    # Loop through all .srt files in the subtitle directory
    for subfile in "$subdir"/*.srt; do
      # Skip if no .srt files found
      [[ -f "$subfile" ]] || continue

      # Add subtitle file as separate track
      cmd+=("$subfile")
    done
  else
    echo "Warning: Subtitle directory $subdir does not exist, skipping subtitles for $video"
  fi

  # Run the mkvmerge command
  echo "Merging subtitles into $video -> $output"
  "${cmd[@]}"
done
