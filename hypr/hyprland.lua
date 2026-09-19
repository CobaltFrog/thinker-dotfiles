---@module 'hl'
require("config.config")
require("config.color")
require("config.functions")

Thinker.set_mic(false)

hl.on("monitor.added", function (m)
    Thinker.display.rebuild()
    Thinker.workspace.rebuild()
    hl.notification.create({
        text = "Display " .. m.name .. " added.\nWorkspaces 1 - " .. Thinker.workspace.count .. " rebuilded.",
        timeout = 3000,
        color = Thinker.color.accent_normal,
        font_size = 18
    })
end)

hl.on("monitor.removed", function (m)
    Thinker.display.rebuild()
    Thinker.workspace.rebuild()
    hl.notification.create({
        text = "Display " .. m.name .. " removed.\nWorkspaces 1 - " .. Thinker.workspace.count .. " rebuilded.",
        timeout = 3000,
        color = Thinker.color.accent_normal,
        font_size = 18
    })
end)

Thinker.display.rebuild()
Thinker.workspace.rebuild();

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
