# dotfiles
blackbeard hyprland dotfiles 
# dotfiles/.config/nvim

<a href="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim"><img src="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim"><img src="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim"><img src="https://dotfyle.com/blacksheepcosmo/dotfiles-config-nvim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Dependencies
 These dependencies are everything I currently use on my 2011 Macbook Pro. Some of these you may or may not need. I will update this on the next merge to be specific to the dotfiles. Note that B43-firmware is specific for the wifi card I have. 
 ```
acpi
alacritty
arch-audit
archiso
autoconf-archive
b43-firmware
base
base-devel
bc
bless
bolt
btrfs-progs
cava
cmake
cpio
dbus-glib
dunst
efibootmgr
electron
electron25-bin
elfutils
fd
fish
flameshot
fuse2
gimp
git
github-cli
grim
gst-libav
gst-plugin-pipewire
gtk-layer-shell
gucharmap
hypr-git
hyprland-git
hyprlang
hyprpaper
hyprpaper-git-debug
intel-media-driver
intel-ucode
iwd
jq
lazygit
libpulse
libva-intel-driver
linux-firmware
linux-hardened
linux-zen
lynis
materia-gtk-theme
meson
nasm
neovim
neovim-nvim-treesitter
neovim-web-devicons-git
network-manager-applet
networkmanager
noto-fonts-emoji
nvim-treesitter-parsers-git
obsidian
p7zip
pacman-contrib
papirus-icon-theme
pipewire
pipewire-alsa
pipewire-jack
pipewire-pulse
plymouth
polkit-gnome
pommed-light
pommed-light-debug
power-profiles-daemon
pulsemixer
qemu-base
qpwgraph
qt5-graphicaleffects
qt5-multimedia
qt5-quickcontrols
qt5-quickcontrols2
qt5-virtualkeyboard
qt5-wayland
qt5ct
qt6-wayland
qt6ct
ripgrep
rustup
scdoc
sddm
setconf
slurp
smartmontools
spotify-launcher
sway
swaybg
swayidle
swaylock-git
swaync
tbtools
ttf-font-awesome
ttf-joypixels
ttf-symbola
ttf-twemoji
ttf-twemoji-color
unzip
vesktop-bin
vulkan-intel
waybar
wev
wget
wireless_tools
wireplumber
wofi
xclip
xdg-desktop-portal-gtk
xdg-desktop-portal-hyprland
xdg-utils
xf86-video-intel
xorg-server
xorg-xinit
yay
yay-debug
zip
zram-generator
```

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:cvusmo/dotfiles
```

Open Neovim with this config:

```sh
NVIM_APPNAME=cvusmo/dotfiles/.config/nvim nvim
```

## Plugins

### color

+ [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)
### colorscheme

+ [scottmckendry/cyberdream.nvim](https://dotfyle.com/plugins/scottmckendry/cyberdream.nvim)
### debugging

+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
### file-explorer

+ [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
### lsp

+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### session

+ [rmagatti/auto-session](https://dotfyle.com/plugins/rmagatti/auto-session)
### startup

+ [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### tabline

+ [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)
### utility

+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
## Language Servers

+ clangd
+ html
+ lua_ls
