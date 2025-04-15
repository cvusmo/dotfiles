#!/bin/bash

# Clear the root window to remove the SDDM background
xsetroot -solid black &

# Set wallpaper (adjust the path to your wallpaper)
feh --bg-fill /home/echo/Wallpapers/wallpaper.jpg &

# Configure monitors (adjust based on your setup)
xrandr --output DP-4 --auto --primary --output DP-2 --left-of DP-4 --rotate left --output DP-0 --right-of DP-4 &

# Start a compositor (optional, e.g., picom for transparency)
picom -f &

# Loop to restart DWM if it crashes (recommended)
while true; do
    # Log errors to a file (optional)
    dwm 2> ~/.dwm.log
done
