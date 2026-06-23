---@module 'hl'

-- local settings = require("settings")
-- TODO: convert . /settings.conf to .lua and use require()

require("config.color")

hl.monitor({
    output = "DP-2",
    mode = "1920x1080@180",
    position = "0x0",
    scale = 1,
    transform = 0
})

hl.monitor({
    output = "HDMI-A-1",
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

-- source = . /source/environment.conf -> requires manual conversion
-- local environment = require("environment")
-- TODO: convert . /source/environment.conf to .lua and use require()

-- permissions

-- source = . /source/permissions.conf -> requires manual conversion
-- local permissions = require("permissions")
-- TODO: convert . /source/permissions.conf to .lua and use require()

-- start

-- source = . /source/exec.conf -> requires manual conversion
-- local exec = require("exec")
-- TODO: convert . /source/exec.conf to .lua and use require()

require("config.appearance")

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
    },
})

hl.config({
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
