#!/bin/bash

# Exit on errors
set -e

# Function to update status
update_status() {
    # Time
    time=$(date "+%Y-%m-%d %H:%M:%S")

    # CPU usage (%)
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

    # RAM usage
    ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')

    # NVMe storage (%)
    nvme=$(df -h /dev/nvme0n1p2 | awk 'NR==2 {print $5}' || echo "N/A")

    # Volume (% or muted)
    vol=$(pulsemixer --get-volume | awk '{print $1}' || echo "N/A")
    mute=$(pulsemixer --get-mute | grep -q 1 && echo "M" || echo "")

    # Flameshot clickable button (using statuscmd syntax)
    flameshot="📸"

    # Power button clickable (triggers dwm-logout.sh)
    power="⏻"

    # Combine into status text
    status="$power | $flameshot | Time: $time | CPU: $cpu% | RAM: $ram | NVMe: $nvme | Vol: $vol%$mute"

    # Set the status bar
    xsetroot -name "$status"
}

# Initial update
update_status

# Loop every 1 second
while true; do
    update_status
    sleep 1
done
