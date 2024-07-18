#!/bin/bash

# Source the color configuration
source ~/.config/blackbeard/blackbeard-color.conf

# Update Hyprland config
cat <<EOF > ~/.config/hypr/hyprland.conf
# Hyprland Configuration
background=$COLOR_BG
foreground=$COLOR_FG
font_light=$COLOR_FONT_LIGHT
font_dark=$COLOR_FONT_DARK
highlight=$COLOR_HIGHLIGHT
EOF

# Update Waybar config
cat <<EOF > ~/.config/waybar/style.css
/* Waybar Configuration */
#bar {
    background-color: $COLOR_BG;
    border-color: $COLOR_FG;
    color: $COLOR_FONT_LIGHT;
}

#clock {
    color: $COLOR_FONT_DARK;
}

#highlight {
    background-color: $COLOR_HIGHLIGHT;
}
EOF

# Update Wofi config
cat <<EOF > ~/.config/wofi/style.css
/* Wofi Configuration */
window {
    background-color: $COLOR_BG;
    color: $COLOR_FONT_LIGHT;
}

listview {
    color: $COLOR_FONT_DARK;
    background-color: $COLOR_HIGHLIGHT;
}
EOF

# Update Neovim config
cat <<EOF > ~/.config/nvim/init.vim
" Neovim Configuration
highlight Normal guibg=$COLOR_BG guifg=$COLOR_FG
highlight Comment guifg=$COLOR_FONT_DARK
highlight CursorLine guibg=$COLOR_HIGHLIGHT
EOF

# Update Alacritty config
cat <<EOF > ~/.config/alacritty/alacritty.yml
# Alacritty Configuration
colors:
  primary:
    background: '$COLOR_BG'
    foreground: '$COLOR_FG'

  normal:
    black:   '$COLOR_1'
    red:     '$COLOR_2'
    green:   '$COLOR_3'
    yellow:  '$COLOR_4'
    blue:    '$COLOR_5'
    magenta: '$COLOR_6'
    cyan:    '$COLOR_7'
    white:   '$COLOR_FONT_LIGHT'

  bright:
    black:   '$COLOR_8'
    red:     '$COLOR_9'
    green:   '$COLOR_10'
    yellow:  '$COLOR_11'
    blue:    '$COLOR_12'
    magenta: '$COLOR_13'
    cyan:    '$COLOR_14'
    white:   '$COLOR_FONT_DARK'
EOF
