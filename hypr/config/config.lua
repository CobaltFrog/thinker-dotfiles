local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

local layouts = { "dwindle", "master", "scrolling", "monocle"}
local monitor_pos = { "auto-left", "auto-down", "auto-up", "auto-right" }

Thinker = {}
Thinker.uwsm_cmd = "uwsm app --"

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

        hl.workspace_rule({
            workspace = tostring(i),
            monitor = display
        })
    end
end
