#!/bin/bash

# Gamemode optimization

CONFIG_FILE="$HOME/.config/hypr/misc.conf"

if grep -q "mouse_move_focuses_monitor" "$CONFIG_FILE"; then
  CURRENT_VALUE=$(grep "mouse_move_focuses_monitor" "$CONFIG_FILE" | awk '{print $2}')

  # Toggle boolean true/false
  if [ "$CURRENT_VALUE" = "true" ]; then
    NEW_VALUE="false"
  else
    NEW_VALUE="true"
  fi

  sed -i "s/mouse_move_focuses_monitor.*/mouse_move_focuses_monitor $NEW_VALUE/" "$CONFIG_FILE"
else
  echo "mouse_move_focuses_monitor true" >> "$CONFIG_FILE"
fi

hyprctl reload
