#!/bin/bash

# Path to the shared colors configuration
COLORS_CONF="$HOME/.config/wofi/color.conf"

# Destination for the Wofi style.css
WOFI_STYLE="$HOME/.config/wofi/style.css"

# Check if colors configuration exists
if [ ! -f "$COLORS_CONF" ]; then
    echo "Colors configuration file not found!"
    exit 1
fi

# Load color definitions
source "$COLORS_CONF"

# Generate Wofi style.css with colors
cat > "$WOFI_STYLE" <<EOF
/* Wofi Style Sheet */
window {
    background-color: $crustAlpha;
    color: $textAlpha;
    border: 5px solid $skyAlpha;
    opacity: 0.93;
    border-radius: 20px;
}

/* focus highlight */
#input:focus {
  border-color: $skyAlpha;
  border: 2px solid $skyAlpha;
}

/* wofi entries */
#entry{
  padding: 5px;
  background-color: $crustAlpha;
}

/* Highlight color */
#entry:selected, #entry:hover {
 background-color: $surface2Alpha;
 color: $rosewaterAlpha;
}

/* Scrollbar styling */
scrollbar slider {
  min-width: 4px;
  background-color: $overlay0Alpha;
}

scrollbar slider:hover {
  background-color: $skyAlpha;
}

#entry:selected #text {
  font-weight: bold;
}

/* Button styling for close, minimize, etc... */
button {
  background-color: $crustAlpha;
  color: $textAlpha;
}

button:hover {
  background-color: $skyAlpha;
  color: $skyAlpha;
}

EOF

echo "Wofi style.css generated with custom colors."

