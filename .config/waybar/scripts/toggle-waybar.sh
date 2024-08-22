#!/bin/bash

WAYBAR_PID=$(pgrep waybar)
if [ -n "$WAYBAR_PID" ]; then
  WAYBAR_VISIBLE=$(pgrep -x waybar)
  if [ -n "$WAYBAR_VISIBLE" ]; then
    pkill waybar
  else
    waybar &
  fi
else
  waybar &
fi
