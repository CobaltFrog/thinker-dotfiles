local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

local layouts = { "dwindle", "master", "scrolling", "monocle"}
local monitor_pos = { "auto-left", "auto-down", "auto-up", "auto-right" }

Thinker = {}
Thinker.uwsm_cmd = "uwsm app --"
Thinker.mic_status = false

Thinker.wallpaper = {}
Thinker.wallpaper.script = "~/.config/hypr/scripts/wallpaper_switch.sh"
Thinker.wallpaper.dir = "~/wallpaper/"

Thinker.apps = {}
Thinker.apps.terminal = "alacritty"
Thinker.apps.browser = "firefox"
Thinker.apps.filer = Thinker.apps.terminal .. " -e spf"
Thinker.apps.messenger = "/bin/Telegram"

Thinker.workspace = {}
Thinker.workspace.count = 10
Thinker.workspace.current_layout_index = 1

Thinker.display = {}
Thinker.display.list = hl.get_monitors()
Thinker.display.main = Thinker.display.list[1]

Thinker.display.current_monitor_pos = 2

function Thinker.workspace.rotate_layout(inc)
    local idx = (Thinker.workspace.current_layout_index -1  + inc) % #layouts + 1
    Thinker.workspace.current_layout_index = idx

    hl.config({ general = { layout = layouts[idx]}})
end

function Thinker.workspace.set_layout(idx)
    Thinker.workspace.current_layout_index = idx
    hl.config({ general = { layout = layouts[Thinker.workspace.current_layout_index]}})
end

function Thinker.workspace.get_layout(idx)
    return layouts[idx]
end

function Thinker.display.rotate_monitor(inc)
    local idx = (Thinker.current_monitor_pos + inc ) % #monitor_pos + 1
    Thinker.current_monitor_pos = idx

    local monitor = hl.get_active_monitor()

    if monitor == nil then return end

    hl.monitor({
        output = monitor.name,
        position = monitor_pos[Thinker.current_monitor_pos]
    })
end

function Thinker.display.set_monitor_position(position_idx)
    Thinker.current_monitor_pos = position_idx

    local monitor = hl.get_active_monitor()

    if monitor == nil then return end

    hl.monitor({
        output = monitor.name,
        position = monitor_pos[Thinker.current_monitor_pos]
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
    Thinker.display.list = hl.get_monitors()
end

function Thinker.workspace.rebuild()
    for i = 1, Thinker.workspace.count do
        local monitor_index = ((i - 1) % #Thinker.display.list) + 1

        local display = Thinker.display.list[monitor_index].name

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
