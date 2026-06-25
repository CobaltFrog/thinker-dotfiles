---@module 'hl'
require("config.color")
require("config.config")

Thinker.display.rebuild()

hl.monitor({
    output = Thinker.display.list[1].name,
    mode = "preffered",
    position = "0x0",
    scale = 1.25,
    transform = 0
})

if (#Thinker.display.list < 1) then
    hl.monitor({
        output = Thinker.display.list[2].name,
        mode = "preffered",
        position = "auto-right",
        scale = 1,
        transform = 0
    })
end

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
