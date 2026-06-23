---@module 'hl'
require("config.color")
require("config.config")

hl.monitor({
    output = Thinker.display.m0name,
    mode = "1920x1080@180",
    position = "0x0",
    scale = 1,
    transform = 0
})

hl.monitor({
    output = Thinker.display.m1name,
    mode = "1920x1080@180",
    position = "-1080x-300",
    scale = 1,
    transform = 1
})

-- auto monitor
hl.monitor({
    output   = "",
    mode     = "preffered",
    position = "auto",
    scale    = "auto",
})

-- env variables
require("config.environment")

hl.permission({ binary = "/usr/bin/hyprlock", type = "screencopy", mode = "allow" })

-- start
require("config.exec")

require("config.appearance")
hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
    },

    ecosystem = {
        enforce_permissions = true,
    },
})

-- input and devices
require("config.input")
require("config.devices")

-- binds
require("config.binds")

-- window and workspace rules
require("config.windowrule")
require("config.workspacerule")
