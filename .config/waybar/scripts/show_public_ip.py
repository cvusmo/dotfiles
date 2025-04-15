#!/usr/bin/env python3

import os
import subprocess
import time
import threading

LOCK_FILE = "/tmp/right_click_network.lock"
MAX_RUNTIME = 3  # Maximum time 


def get_public_ip():
    """Fetch the public IP using an external service."""
    try:
        result = subprocess.run(
            ["curl", "-s", "https://ifconfig.me"],
            stdout=subprocess.PIPE,
            text=True,
        )
        return result.stdout.strip()
    except Exception as e:
        return f"Error: {e}"


def monitor_mouse_release():
    """Continuously monitor mouse state and release lock on right-click release."""
    while os.path.exists(LOCK_FILE):
        try:
            # Check if right-click 
            output = subprocess.run(
                ["xdotool", "getmouselocation", "--shell"],
                stdout=subprocess.PIPE,
                text=True,
            ).stdout
            if "BUTTON=3" not in output:
                if os.path.exists(LOCK_FILE):
                    os.remove(LOCK_FILE)
                break
        except Exception as e:
            print(f"Error: {e}")
            break
        time.sleep(0.1)


def main():
    # Create a lock 
    open(LOCK_FILE, "w").close()

    # Start monitoring mouse release 
    threading.Thread(target=monitor_mouse_release, daemon=True).start()

    start_time = time.time()

    # Loop to display public IP while holding right-click
    while os.path.exists(LOCK_FILE) and time.time() - start_time < MAX_RUNTIME:
        public_ip = get_public_ip()
        # Display public IP using notify-send
        subprocess.run(["notify-send", "Public IP", public_ip])
        time.sleep(0.5)

    # Remove the lock file
    if os.path.exists(LOCK_FILE):
        os.remove(LOCK_FILE)


if __name__ == "__main__":
    main()
