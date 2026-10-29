---@module 'hl'
hl.config({
    general = {
        border_size = 0,
        gaps_in = 0,
        gaps_out = 0,

        layout = Thinker.workspace.get_layout(Thinker.current_layout_index),

        ["col.inactive_border"] = Thinker.color.background_normal,
        ["col.active_border"] = Thinker.color.foreground_normal,
        ["col.nogroup_border"] = Thinker.color.foreground_dark,
        ["col.nogroup_border_active"] = Thinker.color.foreground_dark,
    }
})

if hl.plugin.hyprbars ~= nil then
    hl.config({
        plugin = {
            hyprbars = {
                enabled = true,

                bar_height = 20,
                bar_blur = false,
                bar_part_of_window = false,

                bar_text_size = 14,
                bar_text_font = "JetBrains Nerd Mono",
                bar_text_weight = "bold",

                bar_color = Thinker.color.background_normal,
                ["col.text"] = Thinker.color.foreground_normal,
            }
        }
    })
end

hl.config({
    master = {
        allow_small_split = false,
        mfact = 0.5,
        new_status = "slave",
        orientation = "center",
        slave_count_for_center_master = 2,
        center_master_fallback = "right",
    },
    scrolling = {
        column_width = 0.95,
        focus_fit_method = 0,
    },
})

hl.config({
    decoration = {
        rounding = 0,
        blur = { enabled = false },
    },
})

hl.animation({leaf = "global", enabled = false})
