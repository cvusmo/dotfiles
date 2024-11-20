#!/usr/bin/env python3
import subprocess
import time

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
            return ""
    except Exception as e:
        return ""

def main():
    while True:
        metadata = get_metadata()
        print(metadata)
        time.sleep(1)

if __name__ == "__main__":
    main()
