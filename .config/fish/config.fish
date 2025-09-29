if status is-interactive
    # Custom Fish prompt and other settings…
    set fish_greeting ""
    echo "hoist the black flag"
    sysinfo

    # General Environment
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    set -U fish_user_paths $fish_user_paths $HOME/.local/bin
    set -g fish_autosuggestion_enabled 1

    # Enable vi key bindings
    fish_vi_key_bindings

    # Initialize Starship prompt
    starship init fish | source

    # Vulkan SDK environment variables
    set -x VULKAN_SDK /opt/vulkan/1.4.321.1/x86_64
    set -x PATH $VULKAN_SDK/bin $PATH
    set -x LD_LIBRARY_PATH $VULKAN_SDK/lib $LD_LIBRARY_PATH
    set -x VK_ICD_FILENAMES /usr/share/vulkan/icd.d/nvidia_icd.json
    set -x VK_LAYER_PATH $VULKAN_SDK/etc/vulkan/explicit_layer.d

    # bacon
    set -x BACON $HOME/.cargo/bin/bacon
    set -x PATH $HOME/.cargo/bin $PATH

    # python
    set -gx PATH /home/echo/projects/local/venv/bin $PATH

end
