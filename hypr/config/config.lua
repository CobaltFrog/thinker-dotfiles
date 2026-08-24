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
-- Add monitors in the order in which you want to map workspaces to them
-- (for example, the first workspace will be assigned to the first monitor
-- when calling 'workspace.rebuild()', the second to the second monitor, and so on).
Thinker.display.list = {
    {
        output = "DP-2",
        mode = "1920x1080@180",
        sdrbrightness = 2,
        bitdepth = 10,
        position = "0x0"
    },
    {
        output = "HDMI-A-1",
        mode = "1920x1080@180",
        position = "-1080x-400",
        bitdepth = 10,
        transform = 1
    },
}
Thinker.display.current_monitor_pos = 2
