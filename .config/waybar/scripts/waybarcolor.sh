#!/bin/bash

# Source the color definitions
source ~/.config/blackbeard/blackbeard-color.conf

# Define the output file for Waybar's style.css
output_css="$HOME/.config/waybar/style.css"

# Generate style.css with customized colors
cat > "$output_css" <<EOF
* {
  border: none;
  font-family: 'Hurmit Nerd Font';
  font-size: 18px;
  min-height: 30px;
  color: $COLOR_FONT_LIGHT; /* Using variable from colors.conf */
}

window#waybar {
  background: transparent;
}

#custom-power, #custom-arch, #workspaces-1, #workspaces-2, #workspaces-3 {
  border-radius: 10px;
  background-color: $COLOR_BG; /* Using variable */
  color: $COLOR_BG; /* Using variable */
  margin-top: 5px;
  margin-left: 5px;
  padding-top: 5px;
  padding-left: 5px;
  padding-right: 5px;
  opacity: 0.93;
}

#custom-power {
  background-color: $COLOR_BG;
  color: $COLOR_10; /* Highlight color for power */
  margin-top: 5px;
  margin-right: 5px;
  padding-top: 3px;
  padding-left: 3px;
  padding-right: 3px;
  opacity: 0.93;
}

#custom-arch {
  font-size: 18px;
  background-color: $COLOR_BG;
  color: $COLOR_FONT_LIGHT;
}

#workspaces button, #workspaces-1 button, #workspaces-2 button, #workspaces-3 button {
  background: $COLOR_BG;
  color: $COLOR_FONT_LIGHT;
}

#clock, #custom-playerctl, #backlight, #pulseaudio, #bluetooth, #network, #battery, #custom-diskusage {
  border-radius: 10px;
  background-color: $COLOR_BG;
  color: $COLOR_FONT_LIGHT;
  margin-top: 5px;
  margin-right: 5px;
  padding-top: 3px;
  padding-left: 3px;
  padding-right: 3px;
  opacity: 0.93;
}

#custom-notifications {
  border-radius: 5px;
  background-color: $COLOR_BG;
  color: $COLOR_FONT_LIGHT;
  padding-right: 5px;
  opacity: 0.93;
}

#custom-cava {
  background-color: $COLOR_BG;
  color: $COLOR_FONT_LIGHT;
  border-radius: 10px;
  margin-top: 5px;
  margin-right: 5px;
  margin-left: 5px;
  padding-top: 3px;
  padding-left: 50px;
  padding-right: 50px;
}

#clock {
  margin-right: 0;
}

#custom-music {
  background: $COLOR_BG;
  background: linear-gradient(
    52deg,
    rgba(139, 213, 202, 1) 0%,
    rgba(138, 173, 244, 1) 30%,
    rgba(183, 189, 248, 1) 48%,
    rgba(198, 160, 246, 1) 77%,
    rgba(238, 153, 160, 1) 100%
  );
  background-size: 400% 400%;
  animation: gradient 15s ease infinite;
  text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.377);
  font-weight: bold;
  color: $COLOR_FONT_LIGHT;
  transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
  border: none;
}
EOF

echo "Waybar style.css generated with custom colors."

