#!/usr/bin/env python3
import subprocess
import time
import sys

# Toggle play/pause functionality
def toggle_play_pause():
    try:
        subprocess.run(["playerctl", "play-pause"], check=True)
    except Exception as e:
        print(f"Error toggling playback: {e}")

# Fetch metadata
def get_metadata():
    try:
        status = subprocess.run(["playerctl", "status"], capture_output=True, text=True).stdout.strip()
        artist = subprocess.run(["playerctl", "metadata", "artist"], capture_output=True, text=True).stdout.strip()
        title = subprocess.run(["playerctl", "metadata", "title"], capture_output=True, text=True).stdout.strip()

        if status == "Playing":
            return f"<span color='#1db954'></span> {artist} - {title}"
        elif status == "Paused":
            return f"<span color='#1db954'></span>  {artist} - {title}"
        else:
            return "No media playing"
    except Exception:
        return "No media playing"

# Main function
def main():
    if len(sys.argv) > 1 and sys.argv[1] == "toggle":
        toggle_play_pause()
    else:
        while True:
            metadata = get_metadata()
            print(metadata)
            time.sleep(1)

if __name__ == "__main__":
    main()
