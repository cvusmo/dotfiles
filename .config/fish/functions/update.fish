function update
    switch $argv[1]
        
        # Update mirrors only
        case --mirrors
            echo "Updating mirrors..."
            sudo pacman -S pacman-mirrorlist
            sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
            sudo pacman -Syy
            echo "Mirrors updated successfully."
        
        # Update system, mirrors, NVIDIA and Vulkan packages, then reboot if successful
        case --all
            echo "Updating system and mirrors..."
            sudo pacman -S pacman-mirrorlist
            sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
            sudo pacman -Syy
            sudo pacman -Syu nvidia-dkms nvidia-utils vulkan-icd-loader
            sudo mkinitcpio -P
            
            # Check if update was successful
            if test $status -eq 0
                echo "System and mirrors updated successfully. Rebooting in 3 seconds..."
                sleep 3
                sudo reboot
            else
                echo "System update failed. Please check the output for errors."
            end
        
        # Default system update with NVIDIA and Vulkan packages, then reboot if successful
        case '*'
            echo "Updating system..."
            sudo pacman -Syu nvidia-dkms nvidia-utils vulkan-icd-loader
            sudo mkinitcpio -P
            
            # Check if update was successful
            if test $status -eq 0
                echo "System updated successfully. Rebooting in 3 seconds..."
                sleep 3
                sudo reboot
            else
                echo "System update failed. Please check the output for errors."
            end
    end
end
