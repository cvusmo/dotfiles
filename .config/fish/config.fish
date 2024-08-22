if status is-interactive
<<<<<<< HEAD

    # Custom Fish prompt
    set fish_greeting "" 
=======
<<<<<<< Updated upstream
    # Custom Fish prompt
=======
    # set user path
    set fish_greeting ""
>>>>>>> 8478983c6c93a24b380063109ceb1e453679d03c
    echo "hoist the black flag"
    
    set -Ux fish_user_paths $fish_user_paths $HOME/.local/bin
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
<<<<<<< HEAD
    set -g fish_autosuggestion_enabled 1

    # Start SSH agent
    if test -z "$SSH_AUTH_SOCK" 
      eval (ssh-agent -c)
      ssh-add ~/.ssh/cvusmo
      ssh -T git@github.com
    end

    # ssh-add ~/.ssh/cvusmo
=======
>>>>>>> 8478983c6c93a24b380063109ceb1e453679d03c

    fish_vi_key_bindings

    starship init fish | source

<<<<<<< HEAD
    function fish_prompt
        set_color green
        # echo -n (whoami) '@' (prompt_hostname) ' '
        echo -n (whoami)
        set_color normal
        echo -n ' '

        # Get the current working directory
        set -l full_pwd (prompt_pwd)
        set -l pwd (string replace '~' '🏠' $full_pwd)

        # shorten dir path
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
            echo -n ' ' '(' $branch ')'
        
          end
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
   
  end
=======
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
>>>>>>> 8478983c6c93a24b380063109ceb1e453679d03c
