#!/bin/bash
# ~/.xinitrc - Translated from Hyprland config

# Environment variables
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESSION_TYPE=x11
export XDG_SESSION_DESKTOP=dwm
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GTK_THEME=blackbeard-dark
export GDK_SCALE=1
export XCURSOR_THEME=Nordzy-cursors
export XCURSOR_SIZE=24

# Load cursor settings
xrdb -merge <<EOF
Xcursor.theme: Nordzy-cursors
Xcursor.size: 24
EOF

# Set DPI for scaling (keep 192 for other monitors, DP-2 scaling handled in xorg.conf)
xrdb -merge <<< "Xft.dpi: 192"

# Keyboard layout
setxkbmap us &

# Monitor setup is now handled by /etc/X11/xorg.conf.d/10-monitor.conf
# No need for nvidia-settings command here

# Startup applications
feh --bg-scale ~/.config/dwm/background/background.png &
~/.config/dwm/scripts/statusbar.sh &
dunst &
python3 ~/.config/hypr/scripts/volume_control.py &
deskflowc 10.0.0.6 &  # Replace with your Deskflow server's IP

# Focus the main monitor (DP-4) by moving the mouse cursor to its center
xdotool mousemove 4080 2760 &

# Compositor for animations (optional, disabled for now to test Flameshot)
picom &

# Launch dwm
exec dwm
