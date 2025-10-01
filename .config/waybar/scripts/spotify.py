#!/usr/bin/env python3
import subprocess
import time
import sys
import json


# Toggle play/pause functionality
def toggle_play_pause():
    try:
        subprocess.run(["playerctl", "-p", "spotify", "play-pause"], check=True)
    except Exception as e:
        print(f"Error toggling playback: {e}")


# Fetch metadata
def get_metadata():
    try:
        status = subprocess.run(
            ["playerctl", "-p", "spotify", "status"], capture_output=True, text=True
        ).stdout.strip()
        artist = subprocess.run(
            ["playerctl", "-p", "spotify", "metadata", "artist"],
            capture_output=True,
            text=True,
        ).stdout.strip()
        title = subprocess.run(
            ["playerctl", "-p", "spotify", "metadata", "title"],
            capture_output=True,
            text=True,
        ).stdout.strip()

        if status == "Playing":
            return json.dumps(
                {"text": f"<span color='#1db954'></span> {artist} - {title}"}
            )
        elif status == "Paused":
            return json.dumps(
                {"text": f"<span color='#1db954'></span>  {artist} - {title}"}
            )
        else:
            return json.dumps({"text": ""})
    except Exception:
        return json.dumps({"text": ""})


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
