local layouts = { "dwindle", "master", "scrolling", "monocle"}

Thinker = {}
Thinker.current_layout_index = 1

function Rotate_layout(inc)
    Thinker.current_layout_index = (Thinker.current_layout_index % 4) + inc
    hl.config({ general = { layout = layouts[Thinker.current_layout_index]}})
end

function Get_layout(idx)
    return layouts[idx]
end
