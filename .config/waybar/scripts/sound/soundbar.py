#!/usr/bin/env python3
import os
import subprocess
import time
import sys

WAYBAR_DIR = os.path.expanduser("~/.config/waybar")
SCRIPTS_DIR = os.path.join(WAYBAR_DIR, "sound")
COOLDOWN = 0.1

def soundbar_state():
    """Checks the state of the soundbar."""
    try:
        with open(os.path.join(SCRIPTS_DIR, "soundbar_state.py")) as f:
            return int(f.read().strip())
    except Exception:
        return 0

def arrow_icon():
    """Arrow icon functionality."""
    if soundbar_state() == 0:
        return "■"
    return "■"

def cava_icon(temp_pid):
    """Cava icon functionality."""
    if soundbar_state() == 0:
        pid = subprocess.run(["pgrep", "cava"], stdout=subprocess.PIPE).stdout.decode().strip()
        if pid:
            config = (
                "[general]\nframerate=160\nbars=7\n"
                "[output]\nmethod=raw\nraw_target=/dev/stdout\n"
                "data_format=ascii\nascii_max_range=7\n"
            )
            process = subprocess.Popen(
                ["cava", "-p", "/dev/stdin"],
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
            )
            process.stdin.write(config.encode())
            process.stdin.close()
            temp_pid = process.pid
            return process.stdout.read().decode().translate(str.maketrans("01234567", "▁▂▃▄▅▆▇█"))
    else:
        os.system(f"kill {temp_pid}")
        return ""

def pipewire_icon():
    """PipeWire icon functionality."""
    if soundbar_state() == 0:
        result = subprocess.run(
            ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"],
            stdout=subprocess.PIPE,
        )
        return int(float(result.stdout.decode().split()[1]) * 100)
    return ""

def main():
    temp_pid = None
    while True:
        if len(sys.argv) > 1:
            if sys.argv[1] == "arrow-icon":
                print(arrow_icon())
            elif sys.argv[1] == "cava-icon":
                print(cava_icon(temp_pid))
            elif sys.argv[1] == "pipewire-icon":
                print(pipewire_icon())
            else:
                print("Invalid argument")
        else:
            print("No argument provided")
        time.sleep(COOLDOWN)

if __name__ == "__main__":
    main()
