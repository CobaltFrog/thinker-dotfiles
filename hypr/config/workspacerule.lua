---@module 'hl'

for i = 1, 10 do
    local display
    local layout = nil

    if (i == 4) then
        layout = "rows"
    end

    if (i % 2 == 0) then

        display = Thinker.display.m1name
    else
        display = Thinker.display.m0name
    end

    hl.workspace_rule({
        workspace = tostring(i),
        monitor = display,
        layout = layout
    })
end

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
