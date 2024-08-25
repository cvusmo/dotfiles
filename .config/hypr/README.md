Hyprland Configuration README
Dependencies
From AUR:

    Nordzy-cursors
    Nordzy-cursors-hyprcursor
    materia-theme-git (This Hyprland config uses Materia-dark)

From Pacman:

    wlroots
    aquamarine
    hyprpaper
    hyprcursor
    hyprlock
    hypridle
    dunst
    waybar
    wofi
    fish
    starship

How to Modify the Configuration for Your Setup

To get this Hyprland configuration working on your machine, you'll need to make some adjustments, particularly with your monitor setup. Monitors can be tricky, but with the right guidance, you can tailor the configuration to fit your specific setup.
Monitors Configuration

Hyprland uses a grid-based system to manage monitor layouts. The top-left corner of your main monitor is considered the origin point (0x0). From there, you can set the position of other monitors relative to this point using a combination of positive and negative values to determine the position on the grid.

This configuration is set up for a three-monitor system:

scss

         TOP 
LEFT   CENTER   RIGHT
[DP-4] 
[DP-4] [DP-3]
[DP-4] 
[DP-4] [DP-5]
       BOTTOM

    Main Monitor (Center): DP-5 is positioned at 0x0.
    Top Monitor: DP-3 is positioned above the main monitor.
    Left Monitor (Vertical): DP-4 is positioned to the left and spans vertically across the grid.

Modifying monitors.conf

Within monitors.conf, you'll see comments on how to modify the configuration to suit your setup. Here's a breakdown of what you'll need to do:

    Find Your Monitor Names:
        Run hyprctl monitors all in your terminal to identify the names of your monitors.

    Adjust the Configuration:
        Monitor Names: Replace DP-5, DP-3, and DP-4 with the names of your monitors.
        Resolution and Refresh Rate: Update the resolution and FPS settings to match your monitors.
        Monitor Positioning: Set the positions using the grid system. Remember, 0x0 is the top-left of your main monitor, and other monitors are positioned relative to this point.

The scripts directory holds scripts used by this hyprland configuration. You may need to run the command chmod +x *.sh for all of the *.sh scripts in the directory. Example: chmod +x somescriptname.sh

Modifying hyprlock.conf

Within hyprlock.conf, you'll see comments on how to modify the configuration to suit your setup. Here's a breakdown of what you'll need to do:

    Find Your Monitor Names:
        Run hyprctl monitors all in your terminal to identify the names of your monitors.

    Adjust the Configuration:
        Monitor Names: Replace DP-5 with the name of your main monitor.

