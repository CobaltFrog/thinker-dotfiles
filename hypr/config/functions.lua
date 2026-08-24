local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 2

local LAYOUTS = { "dwindle", "master", "scrolling", "monocle"}
local POSITIONS = { "auto-left", "auto-down", "auto-up", "auto-right" }

---@param inc integer
function Thinker.workspace.rotate_layout(inc)
    local idx = (Thinker.workspace.current_layout_index -1  + inc) % #LAYOUTS + 1
    Thinker.workspace.current_layout_index = idx

    hl.config({ general = { layout = LAYOUTS[idx]}})
end

---@param idx integer
function Thinker.workspace.set_layout(idx)
    Thinker.workspace.current_layout_index = idx
    hl.config({ general = { layout = LAYOUTS[Thinker.workspace.current_layout_index]}})
end

---@param idx integer
function Thinker.workspace.get_layout(idx)
    return LAYOUTS[idx]
end

---@param inc integer
function Thinker.display.rotate_monitor(inc)
    local idx = (Thinker.current_monitor_pos + inc ) % #POSITIONS + 1
    Thinker.current_monitor_pos = idx

    local monitor = hl.get_active_monitor()

    if monitor == nil then return end

    hl.monitor({
        output = monitor.name,
        position = POSITIONS[Thinker.current_monitor_pos]
    })
end

---@param position_idx integer
function Thinker.display.set_monitor_position(position_idx)
    Thinker.current_monitor_pos = position_idx

    local monitor = hl.get_active_monitor()

    if monitor == nil then return end

    hl.monitor({
        output = monitor.name,
        position = POSITIONS[Thinker.current_monitor_pos]
    })
end


---@param offset number
function Thinker.display.zoom(offset)
    local current = hl.get_config("cursor.zoom_factor")
    if offset ~= nil then
        current = current + offset
    elseif current ~= MIN_ZOOM then
        current = MIN_ZOOM
    else
        current = ZOOM_TOGGLE_FACTOR
    end
    current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
    hl.config({ cursor = { zoom_factor = current } })
end

function Thinker.display.rebuild()
    local monitors = hl.get_monitors()

    for i, monitor in ipairs(monitors) do
        if Thinker.display.list[i] then
            hl.monitor(Thinker.display.list[i])
        else
            local new_monitor = {
                output = monitor.name,
                mode = "preffered",
                position = POSITIONS[Thinker.display.current_monitor_pos]
            }
            hl.monitor(new_monitor)
            table.insert(Thinker.display.list, new_monitor)
        end
    end

    -- for _, value in ipairs(Thinker.display.list) do
    --     hl.notification.create({ text = value.output, timeout = 3000 })
    -- end
end

function Thinker.workspace.rebuild()
    if #Thinker.display.list <= 0 then return end

    for i = 1, Thinker.workspace.count do
        local monitor_index = ((i - 1) % #Thinker.display.list) + 1
        local display = Thinker.display.list[monitor_index].output

        if display == nil then return end

        hl.workspace_rule({
            workspace = tostring(i),
            monitor = display
        })
    end
end

function Thinker.toggle_mic()
    if Thinker.mic_status then
        Thinker.set_mic(false)

        -- hl.notification.create({
        --     text = "mic OFF",
        --     timeout = 3000,
        --     color = Thinker.Colors.accent_normal,
        --     font_size = 16
        -- })

        Thinker.mic_status = false
        return
    end

    Thinker.set_mic(true)
    -- hl.notification.create({
    --     text = "mic ON",
    --     timeout = 3000,
    --     color = Thinker.Colors.accent_normal,
    --     font_size = 16
    -- })

    Thinker.mic_status = true
end

---@param status boolean
function Thinker.set_mic(status)
    Thinker.mic_status = status
    local value = nil

    if status then
        value = 0
    else
        value = 1
    end

    hl.dispatch(hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ " .. value))
    hl.dispatch(hl.dsp.exec_cmd("brightnessctl -d platform::micmute set " .. value))
end
