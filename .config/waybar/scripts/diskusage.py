#!/usr/bin/env python3
import os
import subprocess

def get_disk_usage():
    try:
        # Get disk usage using `df`
        result = subprocess.run(
            ["df", "-h", "/"],
            stdout=subprocess.PIPE,
            text=True,
            check=True
        )
        # Extract the available space from the output
        diskusage = result.stdout.splitlines()[1].split()[3]
        print(diskusage)
    except Exception as e:
        print(f"Error getting disk usage: {e}")

if __name__ == "__main__":
    get_disk_usage()
