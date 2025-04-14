#!/usr/bin/env python
import subprocess

try:
    output = (
        subprocess.check_output(
            ["nvidia-smi", "--query-gpu=utilization.gpu", "--format=csv,noheader"]
        )
        .decode()
        .strip()
    )
    gpu_percent = output.replace("%", "").strip()  # Remove % from nvidia-smi output
    print(f"{gpu_percent}%")  # Add % back for Waybar
except:
    print("N/A")
