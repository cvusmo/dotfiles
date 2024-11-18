function fish_prompt
    set_color green
    echo -n (whoami)
    set_color normal
    echo -n ' '

    # Get the current working directory
    set -l full_pwd (prompt_pwd)
    set -l pwd (string replace '~' '🏠' $full_pwd)

    # Shorten dir path
    set -l path_parts (string split / $pwd)
    set -l max_depth 7

    if test (count $path_parts) -gt $max_depth
        echo -n ' 🏠/'
        echo -n (string join / (string sub -l $max_depth $path_parts))
        echo -n '.../ '
    else
        echo -n $pwd
    end

    # Check if in git repo and display branch
    if test -d .git
        set -l branch (git branch --show-current 2>/dev/null)
        echo -n ' (' $branch ')'
    end

    # Get disk usage for root (or specify your drive path)
    set -l disk_usage (df -h / | awk 'NR==2 {print $3 "/" $2}')
    
    echo -n " $disk_usage"  # Display drive usage

    # Mode-specific
    switch $fish_bind_mode
        case insert
            echo -n '   '
        case default
            echo -n ' 󰣙 '
        case normal
            echo -n ' 󰯉 '
        case visual
            echo -n '  '
    end

    set_color normal
end
