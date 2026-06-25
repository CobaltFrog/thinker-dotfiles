---@module 'hl'
require("config.color")
require("config.config")

Thinker.display.rebuild()

require("config.monitors")
hl.monitor({
    output = Monitors[1],
    mode = "1920x1080@180",
    position = "0x0"
})

hl.monitor({
    output = Monitors[2],
    mode = "1920x1080@180",
    position = "auto-left",
    transform = 1
})

hl.monitor({
    output = "",
    mode = "preffered",
    position = "auto-up",
})

hl.on("monitor.added", function (m)
    hl.notification.create({
        text = "display " .. m.name .. " added",
        timeout = 3000,
        color = Thinker.Colors.accent_normal,
        font_size = 14
    })
    Thinker.display.rebuild()
    Thinker.workspace.rebuild()
end)

hl.on("monitor.removed", function (m)
    hl.notification.create({
        text = "display " .. m.name .. " removed",
        timeout = 3000,
        color = Thinker.Colors.accent_normal,
        font_size = 14
    })
    Thinker.display.rebuild()
    Thinker.workspace.rebuild();
end)

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
