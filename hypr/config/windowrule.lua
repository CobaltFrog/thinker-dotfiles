---@module 'hl'

hl.window_rule({
    name  = "wr-discord-mover",
    match = {
        class = "discord",
    },
    workspace = "special:social",
})

hl.window_rule({
    name  = "wr-telegram-mover",
    match = {
        class = ".*telegram.*",
    },
    workspace = "special:social",
})

-- maximize suppressor

hl.window_rule({
    name  = "wr-mx-suppressor",
    match = {
        class = ".*",
    },
    suppress_event = "fullscreen",
})

hl.window_rule({
    name  = "color-youtube",
    match = {
        title = ".*YouTube.*",
    },
    suppress_event = "fullscreenoutput",
    border_color = "rgb(ff0033)",
})

hl.window_rule({
    name  = "color-discord",
    match = {
        class = "discord",
    },
    border_color = "rgb(5c68ee)",
})

hl.window_rule({
    name  = "color-telegram",
    match = {
        class = "org.telegram.desktop",
    },
    border_color = "rgb(5eb5f8)",
})
