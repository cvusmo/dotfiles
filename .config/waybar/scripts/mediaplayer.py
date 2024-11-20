#!/usr/bin/env python3
import subprocess
import sys

def toggle_play_pause(player="mpd"):
    try:
        subprocess.run(["mpc", "--host=localhost", "toggle"], check=True)
    except subprocess.CalledProcessError:
        print(f"Unable to connect to MPD server on localhost.")

def main():
    if len(sys.argv) > 1:
        player = sys.argv[1]
    else:
        player = "mpd"

    toggle_play_pause(player)

if __name__ == "__main__":
    main()
