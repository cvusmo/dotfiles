#!/bin/bash

# Source the color definitions
source ~/.config/waybar/themes/config/color.conf

# Define the output file for Waybar's style.css
output_css="$HOME/.config/waybar/style.css"

# Generate style.css with customized colors
cat > "$output_css" <<EOF
* {
  border: none;
  font-family: 'Hurmit Nerd Font';
  font-size: 12px;
  min-height: 15px;
  color: $textAlpha; /* Using variable from colors.conf */
}

window#waybar {
  background: transparent;
}

#custom-power, #custom-arch, #workspaces {
  border-radius: 10px;
  background-color: $baseAlpha; /* Using variable */
  color: $baseAlpha; /* Using variable */
  margin-top: 5px;
  margin-left: 5px;
  padding-top: 5px;
  padding-left: 5px;
  padding-right: 5px;
}

#custom-power {
  background-color: $baseAlpha;
  color: $redAlpha; /* Highlight color for power */
}

#custom-arch {
  font-size: 15px;
  background-color: $baseAlpha;
  color: $textAlpha;
}

#workspaces button {
  background: $baseAlpha;
  color: $textAlpha;
}

#clock, #backlight, #pulseaudio, #bluetooth, #network, #battery {
  border-radius: 10px;
  background-color: $baseAlpha;
  color: $textAlpha;
  margin-top: 5px;
  margin-right: 5px;
  padding-top: 3px;
  padding-left: 3px;
  padding-right: 3px;
}

#custom-cava {
  background-color: $baseAlpha;
  color: $textAlpha;
  border-radius: 10px;
  margin-top: 5px;
  margin-right: 5px;
  margin-left: 5px;
  padding-top: 3px;
  padding-left: 50px;
  padding-right: 50px;
}

#battery.charging,
#battery.plugged {
  background-color: $baseAlpha;
  color: $textAlpha;
}

#clock {
  margin-right: 0;
}
EOF

echo "Waybar style.css generated with custom colors."

