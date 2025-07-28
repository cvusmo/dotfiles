#!/usr/bin/env python3

import sys

# Update these variables based on your OBS configuration
OBS_HOST = "localhost"
OBS_PORT = 4455
OBS_PASSWORD = "Password"

def toggle_mute(source_name):
    """Toggle mute for a given source in OBS."""
    ws = obsws(OBS_HOST, OBS_PORT, OBS_PASSWORD)
    try:
        ws.connect()
        response = ws.call(requests.GetMute(source_name))
        if response.muted:
            ws.call(requests.SetMute(source_name, False))
            print(f"{source_name} unmuted.")
        else:
            ws.call(requests.SetMute(source_name, True))
            print(f"{source_name} muted.")
    except Exception as e:
        print(f"Failed to connect to OBS WebSocket: {e}")
    finally:
        ws.disconnect()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: obs_mute_control.py <source_name>")
        sys.exit(1)

    source_name = sys.argv[1]
    toggle_mute(source_name)
