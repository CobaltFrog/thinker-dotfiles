---@module 'hl'

hl.config({
    general = {
        border_size = 4,

        gaps_in = 4,
        gaps_out = 4,

        layout = Get_layout(Thinker.current_layout_index),

        ["col.inactive_border"] = Thinker.Colors.background_normal,
        ["col.active_border"] = Thinker.Colors.foreground_normal,
        ["col.nogroup_border"] = Thinker.Colors.foreground_dark,
        ["col.nogroup_border_active"] = Thinker.Colors.foreground_dark,

        snap = {
            enabled = true,
            window_gap = 8,
            monitor_gap = 8
        },
    }
})

hl.config({
    master = {
        allow_small_split = false,
        mfact = 0.5,
        new_status = "slave",
        orientation = "center",
        slave_count_for_center_master = 2,
        center_master_fallback = "right",
    },
})

hl.config({
    scrolling = {
        column_width = 0.95,
        focus_fit_method = 0,
    },
})

hl.config({
    decoration = {
        rounding = 0,
        active_opacity = 1,
        inactive_opacity = 1,
        fullscreen_opacity = 1,
        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            noise = 0.01,
            vibrancy = 0.5,
        },
    },
})

hl.curve("popup", { type = "spring", mass = 1, stiffness = 35, dampening = 6 })
hl.curve("line", { type = "bezier", points = { {0, 0}, {1, 1}}})
hl.curve("inout", { type = "bezier", points = { {0.19, 1}, {0.22, 1.05}}})

hl.animation({ leaf = "windows",     enabled = true, speed = 4, spring = "popup", style = "popin" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "inout", style = "gnomed" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 4, bezier = "inout", style = "fade" })

hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "line" })
