Thinker.workspace.rebuild()

-- rule for monitor binding
hl.workspace_rule({
    workspace = "special:scratchpad",
    layout = "scrolling",
    on_created_empty = "alacritty",
})

hl.workspace_rule({
    workspace = "special:social",
    layout = "scrolling",
})
