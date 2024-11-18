![blackbeard-001](https://github.com/cvusmo/dotfiles/blob/dev/assets/showcase/showcase_001.png?raw=true)

# blackbeard hyprland dotfiles!
These are my current dotfiles that I use daily. I've fixed a few issues with it and it works great. 
IF you use these dotfiles, you will need to configure your monitors. Please read the hyprland wiki
on monitors. [!hyprland-wiki](https://wiki.hyprland.org/Configuring/Monitors/)

TLDR: 

Run hyprctl monitors all to list your monitors
```fish
hyprctl monitors all
```
You'll get something that looks like this:

```fish
Monitor DP-3 (ID 0):
    1920x1080@143.98100 at 0x-1080...
Monitor DP-4 (ID 1):
    3840x2160@59.99700 at -2160x-1920...
Monitor DP-5 (ID 5):
    3840x2160@144.0000 at 0x0...
```

You will need to modify the monitor.conf located in the ~/dotfiles/.config/hypr/*
Setting monitors to properly display is simple. Please read the wiki as it is a
great resource and will make setting your monitors up easy. 
[!hyprland-wiki](https://wiki.hyprland.org/Configuring/Monitors/)

# dotfiles


# dotfiles/.config/nvim

<a href="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim"><img src="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim"><img src="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim"><img src="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

=======
>Dependencies 

>>From pacman:
 ```
wlroots
aquamarine
hyprlock
hypridle
dunst
waybar
wofi
fish
starship
```

>>From AUR:

```
Nordzy-cursors
Nordzy-cursors-hyprcursor
materia-theme-git (This Hyprland config uses Materia-dark)
hyprpicker    
hyprland-git
hyprpaper-git
hypridle-git
hyprcursor-git
aquamarine-git
hyprcursor-git
```


