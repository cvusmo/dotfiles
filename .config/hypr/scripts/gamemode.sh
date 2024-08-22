<<<<<<< HEAD
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

=======
#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    exit
fi
>>>>>>> 8478983c6c93a24b380063109ceb1e453679d03c
hyprctl reload
