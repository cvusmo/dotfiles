#!/bin/bash

# Define the options for the logout menu
OPTIONS="Logout\nRestart\nShutdown\nCancel"

# Use dmenu to display the options
CHOICE=$(echo -e "$OPTIONS" | dmenu -i -fn "Hurmit Nerd Font:size=12")

# Handle the selected option
case "$CHOICE" in
    "Logout")
        # Kill DWM to return to SDDM
        pkill dwm
        ;;
    "Restart")
        # Reboot the system
        systemctl reboot
        ;;
    "Shutdown")
        # Power off the system
        systemctl poweroff
        ;;
    "Cancel")
        # Do nothing
        exit 0
        ;;
esac
