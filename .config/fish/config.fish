if status is-interactive
    # Custom Fish prompt
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
