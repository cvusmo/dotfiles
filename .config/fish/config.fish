if status is-interactive
<<<<<<< Updated upstream
    # Custom Fish prompt
=======
    # set user path
    set fish_greeting ""
    echo "hoist the black flag"
    
    set -Ux fish_user_paths $fish_user_paths $HOME/.local/bin
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim

    fish_vi_key_bindings

    starship init fish | source

>>>>>>> Stashed changes
    function fish_prompt
        set_color green
        echo -n (whoami) '@' (hostname) ' '
        set_color normal
        echo -n (prompt_pwd)
        echo -n ' > '
        set_color normal
    end
    set -Ux fish_user_paths $fish_user_paths $HOME/.local/bin
end
