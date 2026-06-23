---@module 'hl'

-- rule for monitor binding
hl.workspace_rule({
    workspace = "special:scratchpad",
    layout = "scrolling",
    on_created_empty = "alacritty",
    -- layoutopts = "direction:down",
})

hl.workspace_rule({
    workspace = "special:social",
    layout = "scrolling",
    -- layoutopts = "direction:down",
})
