#!/usr/bin/env python3
import subprocess
import json

# Icon mapping for applications
ICON_MAPPING = {
    "firefox": "",
    "neovim": "",
    "flameshot": "󰹑",
    "spotify": "",
    "vesktop": "",
    "steam": "󰓓",
    "wezterm": "",
}


def get_icon_for_class(app_class):
    return ICON_MAPPING.get(app_class, "")  # Default icon


def get_open_windows():
    try:
        # Check if `hyprctl` and `jq` are installed
        subprocess.run(["hyprctl", "--version"], check=True, stdout=subprocess.DEVNULL)
        subprocess.run(["jq", "--version"], check=True, stdout=subprocess.DEVNULL)

        # Get list of open windows
        result = subprocess.run(
            ["hyprctl", "clients", "-j"], stdout=subprocess.PIPE, text=True, check=True
        )
        windows = json.loads(result.stdout)

        # Generate JSON output
        output = []
        for window in windows:
            app_class = window.get("class", "unknown")
            title = window.get("title", "unknown")
            icon = get_icon_for_class(app_class)
            output.append({"class": app_class, "name": title, "icon": icon})

        print(json.dumps(output))

    except FileNotFoundError as e:
        print(f"Error: {e}. Ensure `hyprctl` and `jq` are installed.")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    get_open_windows()
