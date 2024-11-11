function theme
    # Get the current GTK theme
    set current_theme (gsettings get org.gnome.desktop.interface gtk-theme)
    echo "Current GTK Theme: $current_theme"

    # List available themes
    echo "Available Themes:"
    ls /usr/share/themes | awk '{print $1}' # Adjust if needed for specific paths

    # Prompt the user to change the theme
    read -P "Do you want to change the theme? (y/n): " change_theme
    
    if test "$change_theme" = "y"
        # Prompt for the new theme
        read -P "Enter the new theme name: " new_theme

        # Change the theme
        gsettings set org.gnome.desktop.interface gtk-theme "$new_theme"
        echo "Theme changed to: $new_theme"
    else
        echo "No changes made."
    end
end
