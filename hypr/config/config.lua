local layouts = { "dwindle", "master", "scrolling", "monocle"}

Thinker = {}
Thinker.current_layout_index = 1
Thinker.uwsm_cmd = "uwsm app --"

Thinker.wallpaper = {}
Thinker.wallpaper.script = "~/.config/hypr/scripts/wallpaper_switch.sh"
Thinker.wallpaper.dir = "~/wallpaper/"

Thinker.apps = {}
Thinker.apps.terminal = "alacritty"
Thinker.apps.browser = "firefox"
Thinker.apps.filer = Thinker.apps.terminal .. " -e spf"
Thinker.apps.messenger = "/bin/Telegram"

Thinker.display = {}
Thinker.display.m0name = "DP-2"
Thinker.display.m1name = "HDMI-A-1"

function Rotate_layout(inc)
    Thinker.current_layout_index = (Thinker.current_layout_index % 4) + inc
    hl.config({ general = { layout = layouts[Thinker.current_layout_index]}})
end

function Set_layout(idx)
    Thinker.current_layout_index = idx
    hl.config({ general = { layout = layouts[Thinker.current_layout_index]}})
end

function Get_layout(idx)
    return layouts[idx]
end
