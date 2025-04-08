/* config.h for dwm - Translated from Hyprland config */
/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h> /* For multimedia keys like XF86XK_AudioRaiseVolume */
#include <X11/Xlib.h>       /* For Mod4Mask and other X11 constants */
#include <stddef.h>         /* For NULL definition */

/* Appearance */
const unsigned int borderpx  = 2;        /* Border pixel of windows (Hyprland-style) */
const unsigned int snap      = 32;       /* Snap pixel */
const unsigned int gappih    = 5;        /* Horizontal inner gap */
const unsigned int gappiv    = 5;        /* Vertical inner gap */
const unsigned int gappoh    = 5;        /* Horizontal outer gap */
const unsigned int gappov    = 5;        /* Vertical outer gap */
static const int smartgaps    = 0;       /* No outer gap when only one window */
const int showbar            = 1;        /* 0 means no bar */
const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]   = { "Hurmit Nerd Font:size=22" };
static const char dmenufont[] = "Hurmit Nerd Font:size=18";

/* Themes - Colors defined here */
/*#include "themes/blackbearddark.h" */
#include "themes/blackbeardlight.h"  /* Uncomment and rebuild for light theme */

/* Tagging - 20 workspaces to match Hyprland’s 1-20 */
#define TAGCOUNT 20

/* Tag mapping for dynamic labels */
const TagMap tagmap[] = {
    /* classname     tagindex  icon    default_label */
    { "Alacritty",  0,        "",    "" },     /* Workspace 1: Terminal (home) */
    { "firefox",    2,        "",    "" },     /* Workspace 3: Firefox */
    { "Spotify",    3,        "󰓇",   "" },     /* Workspace 4: Spotify */
    { "discord",    4,        "󰙯",   "" },     /* Workspace 5: Discord */
    { "vesktop",    4,        "󰙯",   "" },     /* Workspace 5: Vesktop */
    { "WebCord",    4,        "󰙯",   "" },     /* Workspace 5: WebCord */
    { "blender",    5,        "",    "" },     /* Workspace 6: Blender */
    { "steam",      7,        "󰺵",   "" },     /* Workspace 8: Steam */
    { "gamescope",  7,        "󰺵",   "" },     /* Workspace 8: Gamescope */
    { "atlauncher", 7,        "󰺵",   "" },     /* Workspace 8: Atlauncher */
    { "gimp",       8,        "󰃬",   "" },     /* Workspace 9: GIMP */
    { "hyprclock",  9,        "󱦟",   "" },     /* Workspace 10: Hyprclock */
    { "flameshot",  10,       "",    "" },     /* Workspace 11: Flameshot */
    { NULL,         10,       "",     "11" },    /* Workspace 11 */
    { NULL,         11,       "",     "12" },    /* Workspace 12 */
    { NULL,         12,       "",     "13" },    /* Workspace 13 */
    { NULL,         13,       "",     "14" },    /* Workspace 14 */
    { NULL,         14,       "",     "15" },    /* Workspace 15 */
    { NULL,         15,       "",     "16" },    /* Workspace 16 */
    { NULL,         16,       "",     "17" },    /* Workspace 17 */
    { NULL,         17,       "",     "18" },    /* Workspace 18 */
    { NULL,         18,       "",     "19" },    /* Workspace 19 */
    { NULL,         19,       "",     "20" },    /* Workspace 20 */
};

/* Default tags (used as fallback) */
const char *tags[] = { "home", "", "", "", "", "", "", "", "", "",
                       "", "", "", "", "", "", "", "", "", "" };

/* Rules */
const Rule rules[] = {
    /* class               instance    title           tags mask     isfloating   monitor */
    { "org.blackbeard.installer", NULL, NULL,           0,            1,           -1 }, /* Float */
    { "center-float-large", NULL,   NULL,           0,            1,           -1 }, /* Float */
    { "center-float",       NULL,   NULL,           0,            1,           -1 }, /* Float */
    { "center-float-mini",  NULL,   NULL,           0,            1,           -1 }, /* Float */
    { "file-roller",        NULL,   NULL,           0,            1,           -1 }, /* Float */
    { "galculator",         NULL,   NULL,           0,            1,           -1 }, /* Float */
    { "ytdlp-gui",          NULL,   NULL,           0,            1,           -1 }, /* Float */
    { "Alacritty",          NULL,   NULL,           0,            0,           -1 }, /* Tag 0 */
    { "Spotify",            NULL,   NULL,           1 << 3,       0,           -1 }, /* Tag 3 */
    { "obsproject",         NULL,   NULL,           1 << 3,       0,           -1 }, /* Tag 3 */
    { "discord",            NULL,   NULL,           1 << 4,       0,           -1 }, /* Tag 4 */
    { "vesktop",            NULL,   NULL,           1 << 4,       0,           -1 }, /* Tag 4 */
    { "WebCord",            NULL,   NULL,           1 << 4,       0,           -1 }, /* Tag 4 */
    { "firefox",            NULL,   NULL,           1 << 2,       0,           -1 }, /* Tag 2 */
    { "gimp",               NULL,   NULL,           1 << 8,       0,           -1 }, /* Tag 8 */
    { "hyprclock",          NULL,   NULL,           1 << 9,       1,           -1 }, /* Tag 9 */
    { "blender",            NULL,   NULL,           1 << 5,       0,           -1 }, /* Tag 5 */
    { "steam",              NULL,   NULL,           1 << 7,       0,           -1 }, /* Tag 7 */
    { "steam_app_",         NULL,   NULL,           1 << 7,       0,           -1 }, /* Tag 7 */
    { "gamescope",          NULL,   NULL,           1 << 7,       0,           -1 }, /* Tag 7 */
    { "atlauncher",         NULL,   NULL,           1 << 7,       0,           -1 }, /* Tag 7 */
    { "flameshot",          NULL,   NULL,           1 << 10,      0,           -1 }, /* Tag 10 */
};

/* Layouts */
const float mfact     = 0.55; /* Factor of master area size [0.05..0.95] */
const int nmaster     = 1;    /* Number of clients in master area */
const int resizehints = 0;    /* 0 means ignore size hints for neat tiling */
const int lockfullscreen = 1; /* Define to fix focusstack error in dwm.c */

const Layout layouts[] = {
    /* Symbol     Arrange function */
    { "[]=",      tile },    /* Tiling layout */
    { "><>",      NULL },    /* Floating layout */
    { "[M]",      monocle }, /* Monocle layout (fullscreen) */
};

/* Key definitions */
#define MODKEY Mod4Mask  /* Super key, matches Hyprland’s SUPER */
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* Helper for spawning shell commands */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* Commands */
const char *dmenucmd[] = { "dmenu_run", "-m", "0", "-fn", "monospace:size=10", NULL }; /* Colors handled by theme */
char dmenumon[2] = "0"; /* For dmenu monitor selection */
static const char *termcmd[]  = { "alacritty", NULL };
static const char *filecmd[]  = { "thunar", NULL };
static const char *menucmd[]  = { "rofi", "-show", "drun", NULL };
static const char *browsercmd[] = { "firefox", NULL };
static const char *gimpcmd[]  = { "gimp", NULL };
static const char *vesktopcmd[] = { "vesktop", "--force-device-scale-factor=1", NULL };
static const char *spotifycmd[] = { "spotify-launcher", NULL };
static const char *blendercmd[] = { "blender", NULL };
static const char *kritacmd[] = { "krita", NULL };
static const char *clockcmd[] = { "/home/echo/projects/remote/hyprclock/target/debug/hyprclock", NULL };
static const char *logoutcmd[] = { "/home/echo/.config/hypr/scripts/launch_wlogout.py", NULL };
static const char *volupcmd[] = { "pulsemixer", "--change-volume", "+1", NULL };
static const char *voldowncmd[] = { "pulsemixer", "--change-volume", "-1", NULL };
static const char *volmutecmd[] = { "pulsemixer", "--toggle-mute", NULL };
static const char *screenshotcmd[] = { "flameshot", "gui", NULL }; /* Updated for Flameshot */
static const char *muteaudiocmd[] = { "python3", "/home/echo/.config/hypr/scripts/volume_control.py", "mute", NULL };
static const char *webcmd[] = { "/home/echo/.config/dwm/scripts/search.sh", NULL }; /* Web search */
static const char *scrollupcmd[] = { "xdotool", "click", "4", NULL };    /* Scroll up */
static const char *scrolldowncmd[] = { "xdotool", "click", "5", NULL };  /* Scroll down */
static const char *scrollleftcmd[] = { "xdotool", "click", "6", NULL };  /* Scroll left */
static const char *scrollrightcmd[] = { "xdotool", "click", "7", NULL }; /* Scroll right */
static const char *steamcmd[] = { "steam", NULL }; /* Added for Steam */

/* Keybindings */
Key keys[] = {
    /* modifier                     key        function        argument */
    { MODKEY,                       XK_e,      spawn,          {.v = logoutcmd} },
    { MODKEY,                       XK_q,      killclient,     {0} },
    { MODKEY,                       XK_t,      spawn,          {.v = termcmd} },      /* Launch Alacritty */
    { MODKEY,                       XK_t,      view,           {.ui = 0} },          /* Switch to tag 0 (home) */
    { MODKEY,                       XK_t,      focusmon,       {.i = 0} },          /* Focus DP-4 */
    { MODKEY,                       XK_x,      spawn,          {.v = filecmd} },      /* Launch Thunar */
    { MODKEY,                       XK_r,      spawn,          {.v = menucmd} },
    { MODKEY|ShiftMask,             XK_r,      spawn,          {.v = menucmd} },      /* Finder */
    { MODKEY,                       XK_w,      spawn,          {.v = browsercmd} },   /* Launch Firefox */
    { MODKEY,                       XK_w,      view,           {.ui = 1 << 2} },     /* Switch to tag 2 */
    { MODKEY,                       XK_w,      focusmon,       {.i = 0} },          /* Focus DP-4 */
    { MODKEY,                       XK_g,      spawn,          {.v = gimpcmd} },      /* Launch GIMP */
    { MODKEY,                       XK_g,      view,           {.ui = 1 << 8} },     /* Switch to tag 8 */
    { MODKEY,                       XK_g,      focusmon,       {.i = 0} },          /* Focus DP-4 */
    { MODKEY,                       XK_v,      spawn,          {.v = vesktopcmd} },   /* Launch Vesktop */
    { MODKEY,                       XK_v,      view,           {.ui = 1 << 4} },     /* Switch to tag 4 */
    { MODKEY,                       XK_v,      focusmon,       {.i = 1} },          /* Focus DP-0 */
    { MODKEY,                       XK_s,      spawn,          {.v = spotifycmd} },   /* Launch Spotify */
    { MODKEY,                       XK_s,      view,           {.ui = 1 << 3} },     /* Switch to tag 3 */
    { MODKEY,                       XK_s,      focusmon,       {.i = 0} },          /* Focus DP-4 */
    { MODKEY,                       XK_b,      spawn,          {.v = blendercmd} },   /* Launch Blender */
    { MODKEY,                       XK_b,      view,           {.ui = 1 << 5} },     /* Switch to tag 5 */
    { MODKEY,                       XK_b,      focusmon,       {.i = 0} },          /* Focus DP-4 */
    { MODKEY,                       XK_z,      spawn,          {.v = kritacmd} },     /* Launch Krita */
    { MODKEY,                       XK_c,      spawn,          {.v = clockcmd} },     /* Launch Hyprclock */
    { MODKEY,                       XK_c,      view,           {.ui = 1 << 9} },     /* Switch to tag 9 */
    { MODKEY,                       XK_c,      focusmon,       {.i = 0} },          /* Focus DP-4 */
    { MODKEY,                       XK_m,      spawn,          {.v = steamcmd} },     /* Launch Steam */
    { MODKEY,                       XK_m,      view,           {.ui = 1 << 7} },     /* Switch to tag 7 */
    { MODKEY,                       XK_m,      focusmon,       {.i = 1} },          /* Focus DP-0 */
    { MODKEY|ShiftMask,             XK_m,      spawn,          {.v = muteaudiocmd} },
    { MODKEY|ShiftMask,             XK_s,      spawn,          {.v = screenshotcmd} }, /* Launch Flameshot */
    { MODKEY|ShiftMask,             XK_s,      view,           {.ui = 1 << 10} },    /* Switch to tag 10 */
    { MODKEY|ShiftMask,             XK_s,      focusmon,       {.i = 0} },          /* Focus DP-4 */
    { MODKEY,                       XK_Tab,    focusstack,     {.i = +1} },
    { MODKEY,                       XK_p,      setlayout,      {.v = &layouts[1]} },
    { MODKEY,                       XK_u,      setlayout,      {0} },
    { MODKEY,                       XK_f,      togglefloating, {0} },
    { MODKEY,                       XK_h,      focusstack,     {.i = -1} }, /* Focus previous window */
    { MODKEY,                       XK_n,      focusstack,     {.i = +1} }, /* Focus next window */
    { MODKEY,                       XK_j,      tagmon,         {.i = -1} }, /* Move window to previous monitor */
    { MODKEY,                       XK_l,      tagmon,         {.i = +1} }, /* Move window to next monitor */
    { MODKEY,                       XK_k,      tagmon,         {.i = -1} }, /* Move window to previous monitor */
    { MODKEY,                       XK_i,      tagmon,         {.i = +1} }, /* Move window to next monitor */
    { MODKEY|ShiftMask,             XK_j,      focusmon,       {.i = -1} }, /* Focus previous monitor */
    { MODKEY|ShiftMask,             XK_l,      focusmon,       {.i = +1} }, /* Focus next monitor */
    { MODKEY,                       XK_u,      setmfact,       {.f = -0.05} }, /* Decrease master area */
    { MODKEY,                       XK_o,      setmfact,       {.f = +0.05} }, /* Increase master area */
    { MODKEY|ShiftMask,             XK_k,      incnmaster,     {.i = -1} }, /* Decrease number of master windows */
    { MODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = +1} }, /* Increase number of master windows */
    { MODKEY,                       XK_slash,  spawn,          {.v = webcmd} }, /* Web search */
    { MODKEY,                       XK_Up,     focusstack,     {.i = -1} }, /* Focus previous window */
    { MODKEY,                       XK_Down,   focusstack,     {.i = +1} }, /* Focus next window */
    { MODKEY,                       XK_Left,   setmfact,       {.f = -0.05} }, /* Shrink master area */
    { MODKEY,                       XK_Right,  setmfact,       {.f = +0.05} }, /* Expand master area */
    { MODKEY|ShiftMask,             XK_Up,     spawn,          {.v = scrollupcmd} },    /* Scroll up */
    { MODKEY|ShiftMask,             XK_Down,   spawn,          {.v = scrolldowncmd} },  /* Scroll down */
    { MODKEY|ShiftMask,             XK_Left,   spawn,          {.v = scrollleftcmd} },  /* Scroll left */
    { MODKEY|ShiftMask,             XK_Right,  spawn,          {.v = scrollrightcmd} }, /* Scroll right */
    /* Multimedia keys */
    { 0,                            XF86XK_AudioRaiseVolume, spawn, {.v = volupcmd} },
    { 0,                            XF86XK_AudioLowerVolume, spawn, {.v = voldowncmd} },
    { 0,                            XF86XK_AudioMute, spawn, {.v = volmutecmd} },
    /* Workspace switching */
    TAGKEYS(                        XK_1,                      0)  /* SUPER + 1 for home */
    TAGKEYS(                        XK_2,                      1)
    TAGKEYS(                        XK_3,                      2)
    TAGKEYS(                        XK_4,                      3)
    TAGKEYS(                        XK_5,                      4)
    TAGKEYS(                        XK_6,                      5)
    TAGKEYS(                        XK_7,                      6)
    TAGKEYS(                        XK_8,                      7)
    TAGKEYS(                        XK_9,                      8)
    TAGKEYS(                        XK_0,                      9)
    { MODKEY|ControlMask,           XK_1,      view,           {.ui = 1 << 10} },
    { MODKEY|ControlMask,           XK_2,      view,           {.ui = 1 << 11} },
    { MODKEY|ControlMask,           XK_3,      view,           {.ui = 1 << 12} },
    { MODKEY|ControlMask,           XK_4,      view,           {.ui = 1 << 13} },
    { MODKEY|ControlMask,           XK_5,      view,           {.ui = 1 << 14} },
    { MODKEY|ControlMask,           XK_6,      view,           {.ui = 1 << 15} },
    { MODKEY|ControlMask,           XK_7,      view,           {.ui = 1 << 16} },
    { MODKEY|ControlMask,           XK_8,      view,           {.ui = 1 << 17} },
    { MODKEY|ControlMask,           XK_9,      view,           {.ui = 1 << 18} },
    { MODKEY|ControlMask,           XK_0,      view,           {.ui = 1 << 19} },
    { MODKEY|Mod1Mask,              XK_1,      tag,            {.ui = 1 << 0} },
    { MODKEY|Mod1Mask,              XK_2,      tag,            {.ui = 1 << 1} },
    { MODKEY|Mod1Mask,              XK_3,      tag,            {.ui = 1 << 2} },
    { MODKEY|Mod1Mask,              XK_4,      tag,            {.ui = 1 << 3} },
    { MODKEY|Mod1Mask,              XK_5,      tag,            {.ui = 1 << 4} },
    { MODKEY|Mod1Mask,              XK_6,      tag,            {.ui = 1 << 5} },
    { MODKEY|Mod1Mask,              XK_7,      tag,            {.ui = 1 << 6} },
    { MODKEY|Mod1Mask,              XK_8,      tag,            {.ui = 1 << 7} },
    { MODKEY|Mod1Mask,              XK_9,      tag,            {.ui = 1 << 8} },
    { MODKEY|Mod1Mask,              XK_0,      tag,            {.ui = 1 << 9} },
};

/* Button definitions */
Button buttons[] = {
    /* click                event mask      button          function        argument */
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
};

/* End of config.h */
