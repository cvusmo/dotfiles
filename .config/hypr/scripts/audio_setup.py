#!/usr/bin/env python3

import subprocess
import sys
import time
from datetime import datetime

DEFAULT_SINK = "alsa_output.pci-0000_01_00.1.pro-output-9"


def log_event(message):
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] {message}")


def run_command(command):
    try:
        result = subprocess.run(
            command, shell=True, check=True, text=True, stdout=subprocess.PIPE
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        log_event(f"Command failed: {command} (Error: {e})")
        return ""


def set_default_sink():
    log_event(f"Setting default sink to {DEFAULT_SINK}")
    run_command(f"pactl set-default-sink {DEFAULT_SINK}")


def get_volume(sink=DEFAULT_SINK):
    result = subprocess.run(
        ["pactl", "get-sink-volume", sink], stdout=subprocess.PIPE, text=True
    )
    if result.returncode != 0:
        log_event(f"Error: Unable to get volume for {sink}")
        sys.exit(1)
    volume = result.stdout.split("/")[1].strip().replace("%", "")
    return int(volume)


def set_volume(level, sink=DEFAULT_SINK):
    run_command(f"pactl set-sink-volume {sink} {level}%")
    log_event(f"Volume set to {level}% for {sink}")


def toggle_mute_system(sink=DEFAULT_SINK):
    run_command(f"pactl set-sink-mute {sink} toggle")
    log_event(f"System volume for {sink} muted/unmuted")


def monitor_volume(sink=DEFAULT_SINK, target_volume=25):
    log_event(f"Monitoring volume for {sink}, maintaining at {target_volume}%...")
    while True:
        current_volume = get_volume(sink)
        if current_volume > target_volume:
            set_volume(target_volume, sink)
            log_event(f"Volume reset to {target_volume}% (was {current_volume}%)")
        else:
            log_event(f"Volume is {current_volume}%, no action needed")
        time.sleep(1)


def main():
    set_default_sink()
    if len(sys.argv) < 2:
        log_event("Usage: audio_control.py {increase|decrease|mute|monitor} [amount]")
        sys.exit(1)

    command = sys.argv[1]
    amount = (
        int(sys.argv[2])
        if len(sys.argv) > 2 and command in ["increase", "decrease"]
        else 5
    )
    target_volume = (
        int(sys.argv[2]) if len(sys.argv) > 2 and command == "monitor" else 25
    )

    if command == "increase":
        current_volume = get_volume(DEFAULT_SINK)
        new_volume = min(current_volume + amount, 100)
        set_volume(new_volume, DEFAULT_SINK)
        log_event(f"Volume increased to {new_volume}%")
    elif command == "decrease":
        current_volume = get_volume(DEFAULT_SINK)
        new_volume = max(current_volume - amount, 0)
        set_volume(new_volume, DEFAULT_SINK)
        log_event(f"Volume decreased to {new_volume}%")
    elif command == "mute":
        toggle_mute_system(DEFAULT_SINK)
    elif command == "monitor":
        monitor_volume(DEFAULT_SINK, target_volume)
    else:
        log_event("Invalid command. Use {increase|decrease|mute|monitor}.")
        sys.exit(1)


if __name__ == "__main__":
    main()
