#!/bin/bash

TERMINAL="alacritty"

if pgrep -f "clock-window" > /dev/null; then
  pkill -f "clock-window"
else 
  $TERMINAL --class clock-window --title clock-window -o window.decorations=none -o window.dimensions.columns=20 -o window.dimensions.lines=3 -o font.size=48 -o window.padding.x=10 -o window.padding.y=10 -e bash -c 'while true; do clear; printf "\n\n%*s\n" $((($(tput cols)) + 2 / 2)) "$(date +%H:%M)"; sleep 15; done' &
fi
