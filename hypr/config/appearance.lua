---@module 'hl'

hl.config({
    general = {
        border_size = 4,

        gaps_in = 4,
        gaps_out = 4,

        layout = get_layout(Thinker.current_layout_index),

        ["col.inactive_border"] = Thinker.Colors.background_normal,
        ["col.active_border"] = Thinker.Colors.foreground_normal,
        ["col.nogroup_border"] = Thinker.Colors.foreground_dark,
        ["col.nogroup_border_active"] = Thinker.Colors.foreground_dark,

        snap = {
            enabled = true,
            window_gap = 8,
            monitor_gap = 8
        },

        animations = {
            enabled = true
        }
    }
})

hl.config({
    master = {
        allow_small_split = false,
        mfact = 0.5,
        new_status = "slave",
        orientation = "center",
        slave_count_for_center_master = 2,
        center_master_fallback = "left",
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
