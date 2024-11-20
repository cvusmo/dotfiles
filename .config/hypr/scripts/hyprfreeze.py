#!/usr/bin/env python3

import argparse
import subprocess
import sys

def get_pid_by_active():
    """Get the PID of the active window."""
    result = subprocess.run(["hyprctl", "activewindow", "-j"], stdout=subprocess.PIPE, text=True)
    window_info = json.loads(result.stdout)
    return window_info.get("pid")

def toggle_freeze(pid):
    """Toggle suspension of a process."""
    if not pid:
        print("No PID provided.")
        return

    try:
        state = subprocess.run(["ps", "-o", "state=", "-p", str(pid)], stdout=subprocess.PIPE, text=True).stdout.strip()
        if state == "T":
            # Process is suspended, resume it
            subprocess.run(["kill", "-CONT", str(pid)])
            print(f"Resumed process with PID {pid}")
        else:
            # Process is running, suspend it
            subprocess.run(["kill", "-STOP", str(pid)])
            print(f"Suspended process with PID {pid}")
    except Exception as e:
        print(f"Error toggling freeze: {e}")

def main():
    parser = argparse.ArgumentParser(description="Utility to suspend a game process or other programs in Hyprland.")
    parser.add_argument("-a", "--active", action="store_true", help="Toggle suspend by active window.")
    parser.add_argument("-p", "--pid", type=int, help="Toggle suspend by process ID.")
    parser.add_argument("-n", "--name", help="Toggle suspend by process name.")
    args = parser.parse_args()

    if args.active:
        pid = get_pid_by_active()
    elif args.pid:
        pid = args.pid
    elif args.name:
        result = subprocess.run(["pidof", args.name], stdout=subprocess.PIPE, text=True)
        pid = result.stdout.split()[-1] if result.stdout else None
    else:
        parser.print_help()
        sys.exit(1)

    if pid:
        toggle_freeze(pid)
    else:
        print("No valid PID found.")

if __name__ == "__main__":
    main()

