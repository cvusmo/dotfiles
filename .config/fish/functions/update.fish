function update
    switch $argv[1]
        
        # Update mirrors only
        case --mirrors
            echo "Updating mirrors..."
            sudo pacman -S pacman-mirrorlist
            sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
            sudo pacman -Syy
            if test $status -eq 0
                echo "Mirrors updated successfully."
            else
                echo "Failed to update mirrors. Please check the output for errors."
            end
        
        # Update system, mirrors, NVIDIA and Vulkan packages, headers, then reboot if successful
        case --all
            echo "Updating system and mirrors..."
            sudo pacman -S pacman-mirrorlist
            sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
            sudo pacman -Syy
            echo "Updating yay packages..."
            yay -Syu
            echo "Updating system packages..."
            sudo pacman -Syu nvidia-dkms nvidia-utils vulkan-icd-loader linux-zen linux-headers
            sudo mkinitcpio -P
            
            if test $status -eq 0
                echo "System and mirrors updated successfully. Updating Hyprland headers..."
                sleep 2
                hyprpm update
                if test $status -eq 0
                    echo "Hyprland headers updated successfully. Rebooting in 3 seconds..."
                    yay -Syu
                    sleep 3
                    sudo reboot
                else
                    echo "Hyprland header update failed. Please check the output for errors."
                end
            else
                echo "System update failed. Please check the output for errors."
            end
        
        # Default system update with NVIDIA, Vulkan packages, and headers
        case '*'
            echo "Updating system..."
            sudo pacman -Syu nvidia-dkms nvidia-utils vulkan-icd-loader linux-zen linux-headers
            sudo mkinitcpio -P
            
            if test $status -eq 0
                echo "System updated successfully. Updating yay aur..."
                sleep 2
                yay -Syu
                hyprpm update
                sleep 2
                if test $status -eq 0
                    echo "Hyprland headers updated successfully. Rebooting in 3 seconds..."
                    sleep 3
                    sudo reboot
                else
                    echo "Hyprland header update failed. Please check the output for errors."
                end
            else
                echo "System update failed. Please check the output for errors."
            end
    end
end

