---@module 'hl'

local mod = "SUPER"
-- __        _____ _   _ ____   _____        ______  
-- \ \      / /_ _| \ | |  _ \ / _ \ \      / / ___| 
--  \ \ /\ / / | ||  \| | | | | | | \ \ /\ / /\___ \ 
--   \ V  V /  | || |\  | |_| | |_| |\ V  V /  ___) |
--    \_/\_/  |___|_| \_|____/ \___/  \_/\_/  |____/ 

hl.bind(mod .. "+" .. "Q", hl.dsp.window.close())
hl.bind(mod .. "+" .. "F", hl.dsp.window.float())
hl.bind(mod .. "+" .. "tab", hl.dsp.window.cycle_next())
hl.bind(mod .. "+" .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. "+" .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. "+" .. "right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. "+" .. "down", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. "+" .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. "+" .. "J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. "+" .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. "+" .. "L", hl.dsp.focus({ direction = "right" }))

-- __        _____  ____  _  ______  ____   _    ____ _____ 
-- \ \      / / _ \|  _ \| |/ / ___||  _ \ / \  / ___| ____|
--  \ \ /\ / / | | | |_) | ' /\___ \| |_) / _ \| |   |  _|  
--   \ V  V /| |_| |  _ <| . \ ___) |  __/ ___ \ |___| |___ 
--    \_/\_/  \___/|_| \_\_|\_\____/|_| /_/   \_\____|_____|

for i = 1, 10 do
    local keynum = i % 10
    hl.bind(mod .. "+" .. keynum, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. "+" .. "SHIFT" .. "+" .. keynum, hl.dsp.window.move({ workspace = i }))
    hl.bind(mod .. "+" .. "CONTROL" .. "+" .. keynum, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- special workspaces
hl.bind(mod .. "+" .. "O", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mod .. "+" .. "SHIFT" .. "+" .. "O", hl.dsp.window.move({ workspace = "special:scratchpad" }))
hl.bind(mod .. "+" .. "T", hl.dsp.workspace.toggle_special("social"))

--  __  __ ___ ____ _____ 
-- |  \/  |_ _/ ___| ____|
-- | |\/| || | |   |  _|  
-- | |  | || | |___| |___ 
-- |_|  |_|___\____|_____|

hl.bind(mod .. "+" .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. "+" .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. "+" .. "SHIFT" .. "+" .. "mouse_down", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. "+" .. "mouse_down", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. "+" .. "SHIFT" .. "+" .. "mouse_up", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. "+" .. "mouse_up", hl.dsp.focus({ direction = "down" }))

-- Zoom
hl.bind(mod .. "+mouse:274", Thinker.display.zoom)

--  _   _ _____ ___ _     ___ _____ ___ _____ ____  
-- | | | |_   _|_ _| |   |_ _|_   _|_ _| ____/ ___| 
-- | | | | | |  | || |    | |  | |  | ||  _| \___ \ 
-- | |_| | | |  | || |___ | |  | |  | || |___ ___) |
--  \___/  |_| |___|_____|___| |_| |___|_____|____/ 

hl.bind(mod .. "+" .. "SHIFT" .. "+" .. "L", hl.dsp.exec_raw("~/.config/hypr/scripts/lock.sh"))
hl.bind(mod .. "+" .. "CONTROL" .. "+" .. "Q", hl.dsp.exec_raw("~/.config/hypr/scripts/logout.sh"))
hl.bind(mod .. "+CONTROL+L", hl.dsp.exit())
hl.bind(mod .. "+" .. "RETURN", hl.dsp.exec_cmd(Thinker.apps.terminal))

--terminal accesable in all bind maps
hl.bind(mod .. "+" .. "SHIFT" .. "+" .. "RETURN", hl.dsp.exec_cmd(Thinker.apps.terminal))
hl.bind(mod .. "+" .. "R", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " tofi-drun"))
hl.bind(mod .. "+" .. "SHIFT" .. "+" .. "R", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " tofi-run"))
hl.bind(mod .. "+" .. "V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu| cliphist decode| wl-copy"))
hl.bind(mod .. "+" .. "CONTROL" .. "+" .. "V", hl.dsp.exec_cmd("cliphist wipe & notify-send Wiped clipboard list:  $(cliphist list)"))
hl.bind("Print", hl.dsp.exec_cmd("grim"))
hl.bind("SHIFT" .. "+" .. "Print", hl.dsp.exec_cmd("grim -g $(slurp -w 0)-| swappy -f-"))

--  ____  _   _ ____  __  __    _    ____  ____  
-- / ___|| | | | __ )|  \/  |  / \  |  _ \/ ___| 
-- \___ \| | | |  _ \| |\/| | / _ \ | |_) \___ \ 
--  ___) | |_| | |_) | |  | |/ ___ \|  __/ ___) |
-- |____/ \___/|____/|_|  |_/_/   \_\_|   |____/ 

-- Applications map
hl.bind(mod .. "+" .. "A", hl.dsp.submap("APPS"))
hl.define_submap("APPS", "reset", function()
    hl.bind("B", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " " .. Thinker.apps.browser))
    hl.bind("F", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " " .. Thinker.apps.filer))
    hl.bind("T", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " " .. Thinker.apps.terminal .. " -e btop"))
    hl.bind("C", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " hyprpicker -anzq --format=hex"))
    hl.bind("M", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " " .. Thinker.apps.messenger))
    hl.bind("R", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " remmina"))
    hl.bind("V", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " pavucontrol"))
    hl.bind("S", hl.dsp.exec_raw(Thinker.uwsm_cmd .. " steam"))

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
end)

-- Window size
hl.bind(mod .. "+" .. "S", hl.dsp.submap("RESIZE"))
hl.define_submap("RESIZE", function()
    hl.bind("H", hl.dsp.window.resize({ x = -15, y =   0, relative = true}), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x =   0, y =  15, relative = true}), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x =   0, y = -15, relative = true}), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x =  15, y =   0, relative = true}), { repeating = true })

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
end)

-- Move window
hl.bind(mod .. "+" .. "M", hl.dsp.submap("MOVE"))
hl.define_submap("MOVE", function()
    hl.bind("H", hl.dsp.window.move({ x = -20, y  =   0, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.move({ x =   0, y  =  20, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.move({ x =   0, y  = -20, relative = true }), { repeating = true })
    hl.bind("L", hl.dsp.window.move({ x =  20, y  =   0, relative = true }), { repeating = true })
    hl.bind("SHIFT+H", hl.dsp.window.swap({ direction = "l"}))
    hl.bind("SHIFT+J", hl.dsp.window.swap({ direction = "d"}))
    hl.bind("SHIFT+K", hl.dsp.window.swap({ direction = "u"}))
    hl.bind("SHIFT+L", hl.dsp.window.swap({ direction = "r"}))

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
end)

-- Workspaces manipulation
hl.bind(mod .. "+W", hl.dsp.submap("WORKSPACE"))
hl.define_submap("WORKSPACE", function()
    hl.bind("J", function() Thinker.workspace.rotate_layout(1) end)
    hl.bind("K", function() Thinker.workspace.rotate_layout(-1) end)

    hl.bind("D", function () Thinker.workspace.set_layout(1) end)
    hl.bind("M", function () Thinker.workspace.set_layout(2) end)
    hl.bind("S", function () Thinker.workspace.set_layout(3) end)
    hl.bind("O", function () Thinker.workspace.set_layout(4) end)

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
end)

-- Monitors manipulation
hl.bind(mod .. "+D", hl.dsp.submap("DISPLAY"))
hl.define_submap("DISPLAY", function ()
    hl.bind("U", function () Thinker.display.rotate_monitor(1) end)
    hl.bind("D", function () Thinker.display.rotate_monitor(-1) end)

    hl.bind("H", function () Thinker.display.set_monitor_position(1) end)
    hl.bind("J", function () Thinker.display.set_monitor_position(2) end)
    hl.bind("K", function () Thinker.display.set_monitor_position(3) end)
    hl.bind("L", function () Thinker.display.set_monitor_position(4) end)

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
end)

-- Cursor manipulation
hl.bind(mod .. "+C", hl.dsp.submap("CURSOR"))
hl.define_submap("CURSOR", function()
    hl.bind("equal", function () Thinker.display.zoom(0.5) end)
    hl.bind("minus", function () Thinker.display.zoom(-0.5) end)

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { release = true })
end)

-- Player control
hl.bind(mod .. "+" .. "P", hl.dsp.submap("PLAYER"), { locked = true })
hl.define_submap("PLAYER", function()
    hl.bind("SPACE", hl.dsp.exec_cmd("playerctl play-pause"))

    hl.bind("H", hl.dsp.exec_cmd("playerctl previous"))
    hl.bind("J", hl.dsp.exec_cmd("playerctl play"))
    hl.bind("K", hl.dsp.exec_cmd("playerctl pause"))
    hl.bind("L", hl.dsp.exec_cmd("playerctl next"))

    hl.bind("SHIFT+J", hl.dsp.exec_cmd("playerctl volume 0.01-"),  { repeating = true })
    hl.bind("SHIFT+K", hl.dsp.exec_cmd("playerctl volume 0.01+"),  { repeating = true })
    hl.bind("SHIFT+H", hl.dsp.exec_cmd("playerctl position 10-"),  { repeating = true })
    hl.bind("SHIFT+L", hl.dsp.exec_cmd("playerctl position 10+"),  { repeating = true })

    hl.bind("T", hl.dsp.exec_cmd("playerctl loop Track"))
    hl.bind("R", hl.dsp.exec_cmd("playerctl loop Playlist"))
    hl.bind("Y", hl.dsp.exec_cmd("playerctl loop None"))
    hl.bind("S", hl.dsp.exec_cmd("playerctl shuffle Toggle"))

    -- Информация о треке
    hl.bind("H", hl.dsp.exec_cmd("playerctl previous"))
    hl.bind("D", hl.dsp.exec_raw([[
    sh -c 'notify-send -u normal "󰝚 $(playerctl metadata xesam:title)" "󰠃 $(playerctl metadata xesam:artist)\n󰎆 $(playerctl metadata xesam:album)"'
    ]]))

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
end)
--
-- wallpaper control
hl.bind(mod .. "+" .. "B", hl.dsp.submap("BACKGROUND"))
hl.define_submap("BACKGROUND", function()
    hl.bind("H", hl.dsp.exec_cmd(Thinker.wallpaper.script .. " -wdirprev " .. Thinker.wallpaper.dir))
    hl.bind("J", hl.dsp.exec_cmd(Thinker.wallpaper.script .. " -wnext " .. Thinker.wallpaper.dir))
    hl.bind("K", hl.dsp.exec_cmd(Thinker.wallpaper.script .. " -wprev " .. Thinker.wallpaper.dir))
    hl.bind("L", hl.dsp.exec_cmd(Thinker.wallpaper.script .. " -wdirnext " .. Thinker.wallpaper.dir))

    hl.bind("R", hl.dsp.exec_cmd(Thinker.wallpaper.script .. " -wrandom " .. Thinker.wallpaper.dir))
    hl.bind("G", hl.dsp.exec_cmd(Thinker.wallpaper.script .. " -wload"))

    hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
end)
--  _  _________   ______   ___    _    ____  ____  
-- | |/ / ____\ \ / / __ ) / _ \  / \  |  _ \|  _ \ 
-- | ' /|  _|  \ V /|  _ \| | | |/ _ \ | |_) | | | |
-- | . \| |___  | | | |_) | |_| / ___ \|  _ <| |_| |
-- |_|\_\_____| |_| |____/ \___/_/   \_\_| \_\____/ 

-- MISC
hl.bind("XF86Search", hl.dsp.exec_cmd("local_var_cmd_start_app local_var_appsMenu"))
hl.bind("XF86Explorer", hl.dsp.exec_cmd("local_var_cmd_start_app local_var_fileManager"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("local_var_cmd_start_app local_var_terminal -e calc"))

-- MEDIA
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true })
hl.bind("XF86AudioMicMute", Thinker.toggle_mic)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- SCREEN
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_raw("brightnessctl -e4 -n2 set 1%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_raw("brightnessctl -e4 -n2 set 1%-"), { locked = true })
