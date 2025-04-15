#!/bin/bash
# ~/.xinitrc - Translated from Hyprland config

# Environment variables
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESSION_TYPE=x11
export XDG_SESSION_DESKTOP=dwm
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GTK_THEME=blackbeard-dark
# export GDK_SCALE=1
export XCURSOR_THEME=Nordzy-cursors
export XCURSOR_SIZE=18

# Load cursor settings
xrdb -merge <<EOF
Xcursor.theme: Nordzy-cursors
Xcursor.size: 18
EOF

# Set DPI for scaling (keep 192 for other monitors, DP-2 scaling handled in xorg.conf)
xrdb -merge <<< "Xft.dpi: 192"

# Keyboard layout
setxkbmap us &

# Monitor setup is now handled by /etc/X11/xorg.conf.d/10-monitor.conf
# No need for nvidia-settings command here

# Startup applications
# eww kill &>/dev/null
# eww daemon &
feh --bg-scale ~/.config/dwm/background/background.png &
~/.config/dwm/scripts/statusbar.sh &
# eww open bar &
dunst &
# python3 ~/.config/hypr/scripts/volume_control.py &
deskflowc 10.0.0.6 &
xdotool mousemove 4080 2760 &
picom &

# Launch dwm
exec dwm
