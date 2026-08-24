---@module 'hl'
require("config.color")
require("config.config")
require("config.functions")

Thinker.set_mic(false)

hl.on("monitor.added", function (m)
    hl.notification.create({
        text = "display " .. m.name .. " added",
        timeout = 3000,
        color = Thinker.Colors.accent_normal,
        font_size = 16
    })
    Thinker.display.rebuild()
    Thinker.workspace.rebuild()
end)

hl.on("monitor.removed", function (m)
    hl.notification.create({
        text = "display " .. m.name .. " removed",
        timeout = 3000,
        color = Thinker.Colors.accent_normal,
        font_size = 16
    })
    Thinker.display.rebuild()
    Thinker.workspace.rebuild();
end)

Thinker.display.rebuild()
Thinker.workspace.rebuild()

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
