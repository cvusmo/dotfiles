#!/usr/bin/env python3
import subprocess

def launch_wofi_drun():
    """Launch Wofi in drun mode at a specific position."""
    try:
        subprocess.run([
            "wofi", 
            "--show", "drun", 
            "--location", "custom",
            "--x", "15",  # X position
            "--y", "15"   # Y position
        ], check=True)
    except Exception as e:
        print(f"Failed to launch Wofi: {e}")

if __name__ == "__main__":
    launch_wofi_drun()
