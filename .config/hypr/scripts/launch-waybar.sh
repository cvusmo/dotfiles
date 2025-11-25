#!/bin/bash
# Wait for Hyprland socket and start Waybar, logging to ~/.config/waybar/
LOG_FILE="$HOME/.config/waybar/launch-waybar.log"
HYPRLAND_SOCKET="/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket.sock"
MAX_WAIT=8        # Increased to 8 seconds for slow initialization
WAIT_INTERVAL=0.1 # Check every 0.1 seconds
ELAPSED=0

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

# Helper function to log with timestamp and duration
log_message() {
    local message=$1
    local start_time=$2
    local duration
    duration=$(echo "$(date +%s.%N) - $start_time" | bc)
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $message (took ${duration}s)" >> "$LOG_FILE"
}

# Start timing
START_TIME=$(date +%s.%N)

# Fallback if HYPRLAND_INSTANCE_SIGNATURE is unset
if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    log_message "HYPRLAND_INSTANCE_SIGNATURE unset, searching for socket..." "$START_TIME"
    HYPRLAND_SOCKET=$(find /tmp/hypr -name ".socket.sock" -type s -print -quit 2>/dev/null)
    if [ -z "$HYPRLAND_SOCKET" ]; then
        log_message "No Hyprland socket found, proceeding anyway." "$START_TIME"
    else
        log_message "Found socket at $HYPRLAND_SOCKET" "$START_TIME"
    fi
else
    # Wait for Hyprland socket
    log_message "Waiting for Hyprland socket at $HYPRLAND_SOCKET..." "$START_TIME"
    while [ ! -S "$HYPRLAND_SOCKET" ] && [ $ELAPSED -lt $((MAX_WAIT * 10)) ]; do
        sleep $WAIT_INTERVAL
        ELAPSED=$((ELAPSED + 1))
    done
    if [ ! -S "$HYPRLAND_SOCKET" ]; then
        log_message "Hyprland socket not found after ${MAX_WAIT}s, proceeding anyway." "$START_TIME"
    else
        log_message "Hyprland socket found." "$START_TIME"
    fi
fi

# Wait for monitors
log_message "Checking monitors..." "$START_TIME"
ELAPSED=0
while [ -z "$(hyprctl monitors | grep 'Monitor')" ] && [ $ELAPSED -lt $((MAX_WAIT * 10)) ]; do
    sleep $WAIT_INTERVAL
    ELAPSED=$((ELAPSED + 1))
done
if [ -z "$(hyprctl monitors | grep 'Monitor')" ]; then
    log_message "No monitors detected after ${MAX_WAIT}s, proceeding anyway." "$START_TIME"
else
    log_message "Monitors detected: $(hyprctl monitors | grep 'Monitor' | wc -l)." "$START_TIME"
    hyprctl monitors >> "$LOG_FILE" 2>&1
fi

# Check critical Waybar scripts
log_message "Checking Waybar scripts..." "$START_TIME"
# Test memory_usage.py
SCRIPT_START=$(date +%s.%N)
if ! output=$(python3 ~/.config/waybar/scripts/utils/memory_usage.py 2>>"$LOG_FILE"); then
    log_message "Warning: memory_usage.py failed to execute." "$SCRIPT_START"
else
    log_message "memory_usage.py is ready: $output" "$SCRIPT_START"
fi

# Test cpu_usage.py
SCRIPT_START=$(date +%s.%N)
if ! output=$(python3 ~/.config/waybar/scripts/utils/cpu_usage.py 2>>"$LOG_FILE"); then
    log_message "Warning: cpu_usage.py failed to execute." "$SCRIPT_START"
else
    log_message "cpu_usage.py is ready: $output" "$SCRIPT_START"
fi

# Test gpu_usage.py
SCRIPT_START=$(date +%s.%N)
if ! output=$(python3 ~/.config/waybar/scripts/utils/gpu_usage.py 2>>"$LOG_FILE"); then
    log_message "Warning: gpu_usage.py failed to execute." "$SCRIPT_START"
else
    log_message "gpu_usage.py is ready: $output" "$SCRIPT_START"
fi

# Skip dailytrader_test.py to avoid network delays
log_message "Skipping dailytrader_test.py check to speed up startup." "$START_TIME"

# Start Waybar
log_message "Starting Waybar..." "$START_TIME"
waybar &
WAYBAR_PID=$!
log_message "Waybar started (PID: $WAYBAR_PID)." "$START_TIME"

# Verify Waybar is running
sleep 1
if ps -p $WAYBAR_PID >/dev/null; then
    log_message "Waybar is running successfully." "$START_TIME"
else
    log_message "Error: Waybar failed to start (PID: $WAYBAR_PID)." "$START_TIME"
fi
