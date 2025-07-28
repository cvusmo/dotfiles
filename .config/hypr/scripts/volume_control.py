#!/usr/bin/env python3

import subprocess
import sys

# OBS WebSocket configuration
OBS_HOST = "localhost"
OBS_PORT = 4444
OBS_PASSWORD = "Password"  # Update with your OBS WebSocket password

# Define sinks
DEFAULT_SINK = "alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-output"

def get_volume(sink=DEFAULT_SINK):
    """Get the current volume level for the specified sink."""
    result = subprocess.run(["pactl", "get-sink-volume", sink], stdout=subprocess.PIPE, text=True)
    if result.returncode != 0:
        print("Error: Unable to get volume.")
        sys.exit(1)
    volume = result.stdout.split('/')[1].strip().replace('%', '')
    return int(volume)

def set_volume(level, sink=DEFAULT_SINK):
    """Set the volume to a specific level for the specified sink."""
    subprocess.run(["pactl", "set-sink-volume", sink, f"{level}%"], check=True)

def toggle_mute_system(sink=DEFAULT_SINK):
    """Toggle mute for the specified system sink."""
    subprocess.run(["pactl", "set-sink-mute", sink, "toggle"], check=True)
    print(f"System volume for {sink} muted/unmuted")

def toggle_mute_all():
    """Toggle mute for both system audio and all OBS sources (Microphone, Spotify)."""
    toggle_mute_system()  # Toggle system volume
    toggle_mute_obs("Microphone")  # Toggle OBS Microphone
    toggle_mute_obs("Spotify")  # Toggle OBS Spotify

def main():
    if len(sys.argv) < 2:
        print("Usage: volume_control.py {increase|decrease|mute|mute_all} [amount/source_name]")
        sys.exit(1)

    command = sys.argv[1]
    amount = int(sys.argv[2]) if len(sys.argv) > 2 and command in ["increase", "decrease"] else 5
    source_name = sys.argv[2] if len(sys.argv) > 2 and command == "mute" else None

    current_sink = DEFAULT_SINK

    # Execute the given command
    if command == "increase":
        current_volume = get_volume(current_sink)
        new_volume = min(current_volume + amount, 100)
        set_volume(new_volume, current_sink)
        print(f"Volume increased to {new_volume}%")
    elif command == "decrease":
        current_volume = get_volume(current_sink)
        new_volume = max(current_volume - amount, 0)
        set_volume(new_volume, current_sink)
        print(f"Volume decreased to {new_volume}%")
    elif command == "mute":
        if source_name in ["Microphone", "Spotify"]:
            toggle_mute_obs(source_name)
        else:
            toggle_mute_system(current_sink)
    elif command == "mute_all":
        toggle_mute_all()
    else:
        print("Invalid command. Use {increase|decrease|mute|mute_all}.")
        sys.exit(1)

if __name__ == "__main__":
    main()

