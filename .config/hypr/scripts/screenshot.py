#!/usr/bin/env python3

import subprocess
from datetime import datetime


def main():
    # Get Date-Time Group (DTG)
    print("Getting DTG")
    dtg = datetime.now().strftime("%d%b%Y%H%M%S")
    print(f"DTG: {dtg}")

    # Define file name
    filename = f"/home/echo/pictures/screenshot_{dtg}.png"
    print(f"Saving png as {filename}")

    # Take screenshot with grim
    try:
        subprocess.run(["grim", filename], check=True)
        print(f"Saved as {filename}")

        # Send notification
        subprocess.run(
            ["notify-send", "Screenshot Taken", f"Saved as {filename}"], check=True
        )
    except subprocess.CalledProcessError as e:
        print(f"Error taking screenshot: {e}")


if __name__ == "__main__":
    main()
