if status is-interactive

  # Custom Fish prompt
  set fish_greeting "" 
  echo "hoist the black flag"

  set -Ux fish_user_paths $fish_user_paths $HOME/.local/bin
  set -Ux EDITOR nvim
  set -Ux VISUAL nvim
  set -g fish_autosuggestion_enabled 1

  # Start SSH agent
  if test -z "$SSH_AUTH_SOCK" 
    eval (ssh-agent -c)
    ssh-add ~/DOT SSH/YOUR-SSH
    ssh -T git@github.com
  end

  # ssh-add ~/.ssh/cvusmo

  fish_vi_key_bindings

  starship init fish | source

end 
