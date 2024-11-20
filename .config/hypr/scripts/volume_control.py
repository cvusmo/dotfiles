#!/usr/bin/env python3

import subprocess
import sys

def get_volume():
    """Get the current volume level."""
    result = subprocess.run(["pulsemixer", "--get-volume"], stdout=subprocess.PIPE, text=True)
    volume = result.stdout.split()[0]
    return int(volume)

def set_volume(level):
    """Set the volume to a specific level."""
    subprocess.run(["pulsemixer", "--set-volume", str(level)])

def toggle_mute():
    """Toggle mute."""
    subprocess.run(["pulsemixer", "--toggle-mute"])

def main():
    if len(sys.argv) < 2:
        print("Usage: volume_control.py {increase|decrease|mute} [amount]")
        sys.exit(1)

    command = sys.argv[1]
    amount = int(sys.argv[2]) if len(sys.argv) > 2 else 5
    current_volume = get_volume()

    if command == "increase":
        new_volume = min(current_volume + amount, 100)
        set_volume(new_volume)
        print(f"Volume increased to {new_volume}%")
    elif command == "decrease":
        new_volume = max(current_volume - amount, 0)
        set_volume(new_volume)
        print(f"Volume decreased to {new_volume}%")
    elif command == "mute":
        toggle_mute()
        print("Volume muted/unmuted")
    else:
        print("Invalid command. Use {increase|decrease|mute}.")
        sys.exit(1)

if __name__ == "__main__":
    main()

