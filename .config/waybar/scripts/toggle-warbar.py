#!/usr/bin/env python3
import os
import signal
import subprocess

def toggle_waybar():
    try:
        # Check if Waybar is running
        waybar_pid = subprocess.run(
            ["pgrep", "waybar"],
            stdout=subprocess.PIPE,
            text=True
        ).stdout.strip()

        if waybar_pid:
            # Kill Waybar if running
            os.kill(int(waybar_pid), signal.SIGTERM)
        else:
            # Start Waybar
            subprocess.Popen(["waybar"])
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    toggle_waybar()
