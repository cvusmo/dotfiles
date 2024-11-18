if status is-interactive

    # Custom Fish prompt
    set fish_greeting ""
    echo "hoist the black flag"
    
    # Set universal variables and editor
    set -Ux fish_user_paths $fish_user_paths $HOME/.local/bin
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    set -g fish_autosuggestion_enabled 1

    # Start SSH agent only if not running
    # if test -z "$SSH_AUTH_SOCK"
    #    eval (ssh-agent -c)
    #    ssh-add ~/your-ssh-path
    #    ssh -T git@github.com
    # end

    # Enable vi key bindings
    fish_vi_key_bindings

    # Initialize Starship prompt
    starship init fish | source

    # Vulkan SDK environment variables
    set -x VULKAN_SDK /projects/VulkanSDK/1.3.296.0/x86_64
    set -x PATH $VULKAN_SDK/bin $PATH
    set -x LD_LIBRARY_PATH $VULKAN_SDK/lib $LD_LIBRARY_PATH
    set -x VK_ICD_FILENAMES /usr/share/vulkan/icd.d/nvidia_icd.json
    set -x VK_LAYER_PATH $VULKAN_SDK/etc/vulkan/explicit_layer.d

end
