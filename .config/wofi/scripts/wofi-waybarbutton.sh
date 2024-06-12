#!/bin/bash

# Absolute path to the configuration or needed files
#CONFIG_FILE="$HOME/.config/wofi/config"

# Use the configuration file in commands
#wofi --config $CONFIG_FILE --show drun

geometry=$(swaymsg -t get_tree | jq -r ' .. | select(.name? and .name == "waybar") | .rect | "\(.x),\(.y),\(.width),\(.height)"')

wofi --show drun --width 200 --height 300 --x 10 --y 8

