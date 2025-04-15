#!/bin/bash

# Log directory
LOG_DIR="$HOME/.config/dwm/logs"
mkdir -p "$LOG_DIR"

# Function to update status
update_status() {
    # Time
    time=$(date +%H:%M:%S)

    # CPU usage (%)
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1 2>/dev/null || echo "N/A")

    # RAM usage
    ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}' 2>/dev/null || echo "N/A")

    # NVMe storage (%)
    nvme=$(df -h /dev/nvme0n1p2 | awk 'NR==2 {print $5}' 2>/dev/null || echo "N/A")

    # Volume (% or muted)
    vol=$(pulsemixer --get-volume | awk '{print $1}' 2>/dev/null || echo "N/A")
    mute=$(pulsemixer --get-mute 2>/dev/null | grep -q 1 && echo "M" || echo "")

    # Flameshot clickable button
    flameshot="📸"

    # Power button clickable
    power="⏻"

    # Combine into status text
    status="$power | $flameshot | $time | $cpu% | $ram | $nvme | $vol%$mute"

    # Set the status bar
    xsetroot -name "$status" 2>/dev/null || true
}

# Run the status bar update loop in the background and log its output
(
    while true; do
        update_status
        sleep 1
    done
) >> "$LOG_DIR/statusbar.log" 2>&1 &
