``` Serves as guide to implementing waybar onto your system. ```

```The config file is designed for a multi-monitor desktop setup. If using a laptop, save the config and style.css as configdesktop and styledesktop.css. Rename configlaptop and stylelaptops.css to config and style.css. Run the command hyprctl monitors all. This will show you the name of your monitor. You should see something like this:

Monitor DP-5 (ID 2):
	3840x2160@144.00000 at 0x0
	description: ASUSTek COMPUTER INC VG28UQL1A 1322131231233
	make: ASUSTek COMPUTER INC
	model: VG28UQL1A
	serial: 12345678901234567890
	active workspace: -1337 (main)
	special workspace: 0 ()
	reserved: 0 60 0 0
	scale: 1.00
	transform: 0
	focused: yes
	dpmsStatus: 1
	vrr: 0
	activelyTearing: false
	disabled: false
	currentFormat: XRGB8888
	availableModes: 3840x2160@60.00Hz 3840x2160@144.00Hz...

All you need to know:

Monitor DP-5 (ID 2)
^         ^   ^-device ID
^-device  ^-device name

You only need the device name "DP-5". You'll rename hyprland/workspaces persistant_workspaces to use the device name of your monitor.

  "hyprland/workspaces": {
    "format": "{icon} {name}",
    "on-click": "activate",
    "all-outputs": false,
    "persistent_workspaces": {
      "1": ["DP-5"], # RENAME DP-5 to your monitor name. hyprctl monitors all 
      "2": ["DP-5"],
      "3": ["DP-5"],
      "4": ["DP-5"],
      "5": ["DP-3"],
      "6": ["DP-3"],
      "7": ["DP-3"],
      "8": ["DP-3"],
      "9": ["DP-4"],
      "10": ["DP-4"],
      }
  },
   

