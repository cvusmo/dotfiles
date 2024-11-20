#!/usr/bin/env python3
import sys
import subprocess

# Maximum volume
MAX_VOLUME = 100

# Get the current volume level
def get_current_volume():
    result = subprocess.run(["pulsemixer", "--get-volume"], capture_output=True, text=True)
    return int(result.stdout.split()[0])

# Adjust volume
def adjust_volume(direction, amount):
    current_volume = get_current_volume()
    if direction == "+":
        new_volume = min(current_volume + amount, MAX_VOLUME)
    elif direction == "-":
        new_volume = max(current_volume - amount, 0)
    else:
        raise ValueError("Invalid direction. Use '+' or '-'.")
    subprocess.run(["pulsemixer", "--set-volume", str(new_volume)])

# Toggle mute
def toggle_mute():
    subprocess.run(["pulsemixer", "--toggle-mute"])

# Main function
def main():
    if len(sys.argv) < 2:
        print("Usage: volume_control.py {increase|decrease|mute} [amount]")
        sys.exit(1)

    command = sys.argv[1].lower()
    if command == "increase" and len(sys.argv) == 3:
        adjust_volume("+", int(sys.argv[2]))
    elif command == "decrease" and len(sys.argv) == 3:
        adjust_volume("-", int(sys.argv[2]))
    elif command == "mute":
        toggle_mute()
    else:
        print("Invalid command. Usage: volume_control.py {increase|decrease|mute} [amount]")

if __name__ == "__main__":
    main()
