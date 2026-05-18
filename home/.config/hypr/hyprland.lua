-- Hyprland Lua configuration
-- https://wiki.hypr.land/Configuring/Start/

--------------------------------------------------------------------------------
-- Monitors

-- require("monitors.xps14-mobile")
-- require("monitors.xps14-home")
-- require("monitors.xps14-external")
-- require("monitors.xps14-mirror")
-- require("monitors.radon-home")
require("monitors.current")

--------------------------------------------------------------------------------
-- Devices

hl.device({
    name = "wacom-one-by-wacom-m-pen",
    output = "desc:Lenovo Group Limited LEN D32q-20B 0x01010101",
})

--------------------------------------------------------------------------------
-- Default programs

local terminal = "alacritty"
local filemanager = "thunar"
local browser = os.getenv("HOME") .. "/.dotfiles/bin/browser-default"
local private_browser = os.getenv("HOME") .. "/.dotfiles/bin/firefox-private"
local dotfiles = os.getenv("HOME") .. "/.dotfiles/bin"

--------------------------------------------------------------------------------
-- Autostart

hl.on("hyprland.start", function()
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("wpaperd -d")

    -- If you are using tmux, update tmux's env because Hyprland does not
    -- refresh it when restarted.
    hl.exec_cmd('tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"')
end)

--------------------------------------------------------------------------------
-- Environment variables

hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")

--------------------------------------------------------------------------------
-- Look and feel

local catppuccin_mauve = "rgb(ca9ee6)"
local catppuccin_peach = "rgb(ef9f76)"
local catppuccin_base = "rgb(303446)"

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,

        border_size = 4,

        col = {
            active_border = { colors = { catppuccin_mauve, catppuccin_peach }, angle = 45 },
            inactive_border = catppuccin_base,
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 10,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

--------------------------------------------------------------------------------
-- Input

-- US layout with italian vowels. Capslock is remapped with keyd, not Hyprland.
hl.config({
    input = {
        kb_layout = "it",
        kb_variant = "us",
        kb_model = "",
        kb_options = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },

        repeat_rate = 50,
        repeat_delay = 200,
    },

    binds = {
        allow_workspace_cycles = true,
    },
})

--------------------------------------------------------------------------------
-- Keybindings

local mainMod = "SUPER"

-- Switch back and forth between two recently used workspaces
hl.bind(mainMod .. " + tab", hl.dsp.focus({ workspace = "previous" }))

hl.bind(mainMod .. " + q", hl.dsp.window.kill())

-- vertical split with minus
hl.bind(mainMod .. " + minus", hl.dsp.layout("preselect d"))

-- horizontal split with backslash
hl.bind(mainMod .. " + backslash", hl.dsp.layout("preselect r"))

-- enter fullscreen mode for the focused container
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen())

-- lock screen with Ctrl+Alt+L
hl.bind("CTRL + ALT + l", hl.dsp.exec_cmd(dotfiles .. "/wlockscreen lock"))

-- Toggle floating
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))

-- Select workspace with super + [1-9]
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move current workspace to monitor with super + shift + [hjkl]
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.workspace.move({ monitor = "d" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.workspace.move({ monitor = "r" }))

-- Move focus with super + [hjkl]
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))

-- Move window with super + shift + [hjkl]
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))

-- Start common programs
hl.bind(mainMod .. " + SHIFT + b", hl.dsp.exec_cmd(private_browser))
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + e", hl.dsp.exec_cmd(filemanager))
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind("Print", hl.dsp.exec_cmd(dotfiles .. "/screenshot-edit"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(dotfiles .. "/screenshot-full"))
hl.bind(mainMod .. " + SHIFT + v", hl.dsp.exec_cmd(dotfiles .. "/menu-paste"))

-- Start menus
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(dotfiles .. "/dmenu-run"))
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd(dotfiles .. "/dmenu-pass"))
hl.bind(mainMod .. " + SHIFT + return", hl.dsp.exec_cmd(dotfiles .. "/dmenu-ssh"))
hl.bind(mainMod .. " + SHIFT + c", hl.dsp.exec_cmd(dotfiles .. "/dmenu-common-clip"))
hl.bind(mainMod .. " + a", hl.dsp.exec_cmd(dotfiles .. "/dmenu-actions"))

-- Scratchpad
hl.bind(mainMod .. " + 0", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + z", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces on monitor
hl.bind("mouse:275", hl.dsp.focus({ workspace = "m+1" }))
hl.bind("mouse:276", hl.dsp.focus({ workspace = "m-1" }))

-- Open next empty workspace
hl.bind(mainMod .. " + w", hl.dsp.focus({ workspace = "empty" }))

-- Move/resize windows
hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("ALT + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio volume up/down (PulseAudio)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(dotfiles .. "/audio-control out_volume_up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(dotfiles .. "/audio-control out_volume_down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(dotfiles .. "/audio-control out_mute_toggle"), { locked = true })

-- Control audio players (like Spotify) using playerctl
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(dotfiles .. "/playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(dotfiles .. "/playerctl next"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(dotfiles .. "/playerctl play-pause"), { locked = true })

--------------------------------------------------------------------------------
-- Windows and workspaces

hl.layer_rule({ match = { namespace = ".*" }, blur = true })
