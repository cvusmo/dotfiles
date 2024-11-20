#!/usr/bin/env python3

import subprocess
import time
from datetime import datetime

# Define audio devices and streams
DEFAULT_SINK = "alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-output"
OBS_MONITOR_SINK = "alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-output.monitor"
OBS_MIC = "alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-input"
SPOTIFY_STREAM = "spotify"
OBS_STREAM = "OBS"

def log_event(message):
    """Log messages with timestamps."""
    print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] {message}")

def run_command(command):
    """Run a system command and return the output."""
    try:
        result = subprocess.run(command, shell=True, check=True, text=True, stdout=subprocess.PIPE)
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        log_event(f"Command failed: {command}")
        return ""

def route_spotify_to_obs():
    """Route Spotify stream to OBS input."""
    log_event("Routing Spotify to OBS input...")
    sink_inputs = run_command("pactl list sink-inputs | grep -B 10 spotify | grep 'Sink Input' | awk '{print $3}'")
    for input_id in sink_inputs.splitlines():
        log_event(f"Moving Spotify stream {input_id} to OBS input ({OBS_MONITOR_SINK})")
        run_command(f"pactl move-sink-input {input_id} {OBS_MONITOR_SINK}")

def route_spotify_to_headphones():
    """Route Spotify stream to headphones."""
    log_event("Routing Spotify to headphones...")
    sink_inputs = run_command("pactl list sink-inputs | grep -B 10 spotify | grep 'Sink Input' | awk '{print $3}'")
    for input_id in sink_inputs.splitlines():
        log_event(f"Moving Spotify stream {input_id} to {DEFAULT_SINK}")
        run_command(f"pactl move-sink-input {input_id} {DEFAULT_SINK}")

def route_obs_monitor_to_headphones():
    """Route OBS monitor to headphones."""
    log_event("Routing OBS monitor to headphones...")
    sink_inputs = run_command("pactl list sink-inputs | grep -B 10 OBS | grep 'Sink Input' | awk '{print $3}'")
    for input_id in sink_inputs.splitlines():
        log_event(f"Moving OBS stream {input_id} to {DEFAULT_SINK}")
        run_command(f"pactl move-sink-input {input_id} {DEFAULT_SINK}")

def route_mic_to_obs():
    """Route microphone to OBS."""
    log_event(f"Routing microphone ({OBS_MIC}) to OBS...")
    run_command(f"pactl set-default-source {OBS_MIC}")

def route_mic_to_output():
    """Route microphone to output sink."""
    log_event(f"Routing microphone ({OBS_MIC}) to output sink ({DEFAULT_SINK})...")
    run_command(f"pactl move-source-output {OBS_MIC} {DEFAULT_SINK}")

def is_obs_running():
    """Check if OBS is running."""
    result = run_command("pgrep -x obs")
    return bool(result)

def main():
    """Main routing logic."""
    obs_status = is_obs_running()
    while True:
        if is_obs_running() != obs_status:  # Detect status change
            obs_status = not obs_status
            if obs_status:
                log_event("OBS has started. Applying custom routing...")
                route_spotify_to_obs()
                route_obs_monitor_to_headphones()
                route_mic_to_obs()
            else:
                log_event("OBS has stopped. Resetting routing to default.")
                route_spotify_to_headphones()
                route_mic_to_output()
        time.sleep(5)  # Check every 5 seconds

if __name__ == "__main__":
    main()
