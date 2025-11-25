#!/usr/bin/env python3
import os
import time
import subprocess
import socket

def wait_for_hyprland():
    socket_path = f"/tmp/hypr/{os.environ.get('HYPRLAND_INSTANCE_SIGNATURE')}/.socket.sock"
    max_wait = 10  # seconds
    wait_interval = 0.5  # seconds
    elapsed = 0

    print(f"Waiting for Hyprland socket at {socket_path}...")
    while not os.path.exists(socket_path) and elapsed < max_wait:
        time.sleep(wait_interval)
        elapsed += wait_interval

    if not os.path.exists(socket_path):
        print(f"Hyprland socket not found after {max_wait}s, starting Waybar anyway.")
    else:
        print("Hyprland socket found, checking monitors...")
        while elapsed < max_wait:
            result = subprocess.run(["hyprctl", "monitors"], capture_output=True, text=True)
            if "Monitor" in result.stdout:
                break
            time.sleep(wait_interval)
            elapsed += wait_interval

    print("Starting Waybar...")
    subprocess.run(["waybar"])

if __name__ == "__main__":
    wait_for_hyprland()
