#!/usr/bin/env python3

import subprocess
import time

def launch_wlogout():
    """Launch wlogout and move it to a specified position using Hyprland."""
    x, y = 100, 200  # Desired position

    # Launch wlogout
    subprocess.Popen(["wlogout"])
    time.sleep(0.5)  # Wait for wlogout to launch

    # Move window using hyprctl
    try:
        subprocess.run(["hyprctl", "dispatch", f"move {x} {y} [title:wlogout]"], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error moving wlogout window: {e}")

if __name__ == "__main__":
    launch_wlogout()
