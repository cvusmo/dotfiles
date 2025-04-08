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
export GDK_SCALE=2
export XCURSOR_THEME=Nordzy-cursors
export XCURSOR_SIZE=24

# Load cursor settings
xrdb -merge <<EOF
Xcursor.theme: Nordzy-cursors
Xcursor.size: 24
EOF

# Set DPI for scaling
xrdb -merge <<< "Xft.dpi: 192"

# Keyboard layout
setxkbmap us &

# Monitor setup
xrandr --output DP-4 --mode 3840x2160 --rate 144 --pos 2160x1680 --primary \
       --output DP-0 --mode 1920x1080 --rate 144 --pos 4103x600 \
       --output DP-2 --mode 3840x2160 --rate 60 --pos 0x0 --rotate left \
       --output HDMI-0 --mode 3840x2160 --rate 60 --same-as DP-4 &

# Startup applications
feh --bg-scale ~/.config/dwm/background/background.png &
~/.config/dwm/scripts/statusbar.sh &
dunst &
python3 ~/.config/hypr/scripts/volume_control.py &

# Compositor for animations (optional)
picom &

# Launch dwm
exec dwm
