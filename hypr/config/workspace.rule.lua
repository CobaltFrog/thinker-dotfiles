---@module 'hl'

-- rule for monitor binding
hl.workspace_rule({
    workspace = "special:scratchpad",
    layout = "scrolling",
    ["on-created-empty"] = hl.dsp.exec_cmd("alacritty"),
    layoutopts = "direction:down",
})

hl.workspace_rule({
    workspace = "special:social",
    layout = "scrolling",
    layoutopts = "direction:down",
})
