#!/bin/bash

# Ensure jq is installed
if ! command -v jq &> /dev/null; then
  echo "jq could not be found. Please install it and try again."
  exit 1
fi

# Ensure hyprctl is installed
if ! command -v hyprctl &> /dev/null; then
  echo "hyprctl could not be found. Please install it and try again."
  exit 1
fi

# Function to get icon for class
get-icon-for-class() {
  case "$1" in
    "firefox")
      echo ""
      ;;
    "waterfox")
      echo ""  # Assuming Waterfox uses the same icon as Firefox, adjust if needed
      ;;
    "neovim")
      echo ""
      ;;
    "flameshot")
      echo ":"  # Adjust to the actual flameshot icon if needed
      ;;
     "spotify")
      echo ""
      ;;
    "vesktop")
      echo ""  # Discord icon for vesktop
      ;;
    # Add more mappings as needed
    *)
      echo "  "  # Default icon
      ;;
  esac
}

# Get the list of open windows with their application names using hyprctl
windows=$(hyprctl clients -j | jq -r '.[] | "\(.class) \(.title)"')

# Generate JSON output for Waybar
output='['
first=true
while read -r class name; do
  if [ "$first" = true ]; then
    first=false
  else
    output+=','
  fi
  icon=$(get-icon-for-class $class)
  output+="{\"class\":\"$class\",\"name\":\"$name\",\"icon\":\"$icon\"}"
done <<< "$windows"
output+=']'

echo $output

