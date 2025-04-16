#!/usr/bin/env python3
import os
import tomli  # Changed from 'toml' to 'tomli'
import tomli_w  # Added for writing TOML

CONFIG_PATH = os.path.expanduser("~/.config/hypr/hyprclock.conf")


def load_config():
    try:
        with open(CONFIG_PATH, "rb") as f:
            return tomli.load(f)
    except FileNotFoundError:
        return {"general": {"clock_format": "24-hour", "time_precision": "short"}}


def save_config(config):
    os.makedirs(os.path.dirname(CONFIG_PATH), exist_ok=True)
    with open(CONFIG_PATH, "wb") as f:  # tomli_w requires binary mode
        tomli_w.dump(config, f)


def toggle_format():
    config = load_config()
    current_precision = config.get("general", {}).get("time_precision", "short")
    new_precision = "long" if current_precision == "short" else "short"
    config.setdefault("general", {})["time_precision"] = new_precision
    save_config(config)
    print(f"Toggled time_precision from {current_precision} to {new_precision}")


if __name__ == "__main__":
    toggle_format()
