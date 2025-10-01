#!/usr/bin/env python3
import os
import tomli
import tomli_w

CONFIG_PATH = os.path.expanduser("~/.config/hypr/hyprclock.conf")
SIGNAL_FILE = os.path.expanduser("~/.cache/hyprclock_signal")


def load_config():
    try:
        with open(CONFIG_PATH, "rb") as f:
            return tomli.load(f)
    except FileNotFoundError:
        return {"general": {"clock_format": "24-hour", "time_precision": "short"}}


def save_config(config):
    os.makedirs(os.path.dirname(CONFIG_PATH), exist_ok=True)
    with open(CONFIG_PATH, "wb") as f:
        tomli_w.dump(config, f)


def toggle_format():
    config = load_config()
    current_format = config.get("general", {}).get("clock_format", "24-hour")
    new_format = "12-hour" if current_format == "24-hour" else "24-hour"
    config.setdefault("general", {})["clock_format"] = new_format
    save_config(config)


def signal_calendar():
    # Create a signal file to trigger the calendar in the running hyprclock process
    os.makedirs(os.path.dirname(SIGNAL_FILE), exist_ok=True)
    with open(SIGNAL_FILE, "w") as f:
        f.write("show_calendar")


if __name__ == "__main__":
    import sys

    if len(sys.argv) > 1 and sys.argv[1] == "--show-calendar":
        signal_calendar()
    else:
        toggle_format()
