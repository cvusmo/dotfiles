function update
  # Update system
  sudo pacman -Syu
  sudo pacman -Syu nvidia-dkms
  sudo mkinitcpio -P
  if test $status -eq 0
    echo "System updated successfully. Rebooting in 3 seconds..."
    sleep 3
    sudo reboot
  else
    echo "System update failed. Please check the output for errors."
  end
end
