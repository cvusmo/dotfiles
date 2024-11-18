function search
    # Show the available block devices
    echo "Available drives:"
    lsblk

    # Check if the user provided a drive argument
    echo -n "Please enter the drive you want to search (e.g., /dev/sdX): "
    read DRIVE  # Read the drive from user input

    sudo cryptsetup isLuks $DRIVE

    set is_encrypted $status

    if test $is_encrypted -eq 0
        echo -n "Please enter your LUKS password: "
        read -s password
        echo

        echo "$password" | sudo -S cryptsetup luksOpen $DRIVE DRIVE_crypt
        if test $status -ne 0
            echo "Failed to unlock the drive. Please check your password or device."
            return 1
        end

        sudo mkdir -p /mnt/tmp_drive
        sudo mount /dev/mapper/DRIVE_crypt /mnt/tmp_drive
        if test $status -ne 0
            echo "Failed to mount the drive."
            sudo cryptsetup luksClose DRIVE_crypt
            return 1
        end
    else
        echo "The drive is not encrypted. Mounting it directly."
        sudo mkdir -p /mnt/tmp_drive
        sudo mount $DRIVE /mnt/tmp_drive
        if test $status -ne 0
            echo "Failed to mount the drive."
            return 1
        end
    end

    # Prompt for the files to search
    echo -n "Please enter the names of the files you are looking for (separated by space): "
    read -a file_names 

    set found_files (sudo find /mnt/tmp_drive -type f \( -name "$file_names[1]" -o -name "$file_names[2]" \))

    if test (count $found_files) -gt 0
        echo "Files found:"
        echo $found_files
    else
        echo "No files found."

        sudo umount /mnt/tmp_drive
        if test $is_encrypted -eq 0
            sudo cryptsetup luksClose DRIVE_crypt
        end
        return 0
    end

    # Prompt for the destination path
    echo -n "Please enter the destination path to copy the files: "
    read destination_path

    mkdir -p $destination_path

    for file in $found_files
        cp "$file" "$destination_path/"
        if test $status -eq 0
            echo "Copied: $file to $destination_path/"
        else
            echo "Failed to copy: $file"
        end
    end

    # Unmount the drive and close it if encrypted
    sudo umount /mnt/tmp_drive
    if test $is_encrypted -eq 0
        sudo cryptsetup luksClose DRIVE_crypt
    end
end
