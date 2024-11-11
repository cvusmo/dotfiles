import subprocess

# Takes screenshot using grim

# *.png naming
from datetime import datetime
print("Getting DTG")
dtg = datetime.now().strftime("%d%b%Y%H%M")
print(f"DTG: {dtg}")
filename = f"/home/echo/Pictures/screenshot_{dtg}.png"

# Screenshot using grim
print("Saving png")
subprocess.run(["grim", filename])
print(f"Saved as {filename}")

# Send a notification
subprocess.run(["notify-send", "Screenshot Taken", f"Saved as {filename}"])
