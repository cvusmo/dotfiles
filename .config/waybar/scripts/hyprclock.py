#!/usr/bin/env python3
import subprocess
import json
import time
import os
import tomli  # Changed from 'toml' to 'tomli'

# Update this path to match your built binary.
HYPRCLOCK_PATH = "/home/echo/projects/remote/hyprclock/target/release/hyprclock"
CONFIG_PATH = os.path.expanduser("~/.config/hyprclock/hyprclock.conf")


def load_config():
    try:
        with open(CONFIG_PATH, "rb") as f:  # tomli requires binary mode
            return tomli.load(f)
    except FileNotFoundError:
        return {"general": {"clock_format": "24-hour", "time_precision": "short"}}


def get_hyprclock_output():
    if not os.path.exists(HYPRCLOCK_PATH):
        return json.dumps({"text": "Error"})

    try:
        result = subprocess.run(
            [HYPRCLOCK_PATH, "--waybar"],  # Restored --waybar flag
            capture_output=True,
            text=True,
            timeout=5,
        )
        if result.returncode == 0:
            output = json.loads(result.stdout.strip())
            # Load config to check time_precision
            config = load_config()
            time_precision = config.get("general", {}).get("time_precision", "short")
            # Trim seconds if time_precision is "short"
            text = output.get("text", "")
            if time_precision == "short":
                parts = text.split(":")
                if len(parts) == 3:
                    output["text"] = ":".join(parts[:2])
            return json.dumps({"text": output["text"]})
        else:
            return json.dumps({"text": "Error"})
    except (subprocess.SubprocessError, FileNotFoundError, json.JSONDecodeError):
        return json.dumps({"text": "Error"})


def main():
    while True:
        print(get_hyprclock_output(), flush=True)
        time.sleep(1)


if __name__ == "__main__":
    import sys

    main()
