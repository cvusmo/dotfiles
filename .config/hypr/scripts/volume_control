#!/bin/bash

# Get the current volume level using pulsemixer and awk for parsing
current_volume=$(pulsemixer --get-volume | awk '{print $1}')

# Define the maximum volume level
max_volume=100

# Function to adjust volume
adjust_volume() {
    if [[ "$1" == "+" ]]; then
        new_volume=$((current_volume + $2))
        if (( new_volume <= max_volume )); then
            pulsemixer --set-volume $new_volume
        else
            pulsemixer --set-volume $max_volume
        fi
    elif [[ "$1" == "-" ]]; then
        new_volume=$((current_volume - $2))
        if (( new_volume < 0 )); then
            pulsemixer --set-volume 0
        else
            pulsemixer --set-volume $new_volume
        fi
    fi
}

# Function to mute volume
toggle_mute() {
    pulsemixer --toggle-mute
}

# Check arguments and call appropriate function
case "$1" in
    increase)
        adjust_volume "+" "$2"
        ;;
    decrease)
        adjust_volume "-" "$2"
        ;;
    mute)
        toggle_mute
        ;;
    *)
        echo "Invalid command: $1"
        echo "Usage: $0 {increase|decrease|mute} [amount]"
        exit 1
        ;;
esac

