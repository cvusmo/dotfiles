#!/usr/bin/env python3

import subprocess
import json

def get_focused_monitor():
    """Retrieve the name of the currently focused monitor."""
    result = subprocess.run(["hyprctl", "monitors", "-j"], stdout=subprocess.PIPE, text=True)
    monitors = json.loads(result.stdout)
    for monitor in monitors:
        if monitor.get("focused", False):
            return monitor["name"]
    return None

if __name__ == "__main__":
    focused_monitor = get_focused_monitor()
    if focused_monitor:
        print(focused_monitor)
    else:
        print("No focused monitor found.")
