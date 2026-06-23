---@module 'hl'

local mod = "SUPER"
-- __        _____ _   _ ____   _____        ______  
-- \ \      / /_ _| \ | |  _ \ / _ \ \      / / ___| 
--  \ \ /\ / / | ||  \| | | | | | | \ \ /\ / /\___ \ 
--   \ V  V /  | || |\  | |_| | |_| |\ V  V /  ___) |
--    \_/\_/  |___|_| \_|____/ \___/  \_/\_/  |____/ 

hl.bind(mod .. " + " .. "Q", hl.dsp.window.close())
hl.bind(mod .. " + " .. "F", hl.dsp.window.float())
hl.bind("ALT" .. " + " .. "tab", hl.dsp.window.cycle_next())
hl.bind("CONTROL" .. " + " .. "tab", hl.dsp.focus({ last = true }))
hl.bind(mod .. " + " .. "tab", hl.dsp.window.cycle_next())
hl.bind(mod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + " .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + " .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + " .. "L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + " .. "J", hl.dsp.focus({ direction = "down" }))

-- __        _____  ____  _  ______  ____   _    ____ _____ 
-- \ \      / / _ \|  _ \| |/ / ___||  _ \ / \  / ___| ____|
--  \ \ /\ / / | | | |_) | ' /\___ \| |_) / _ \| |   |  _|  
--   \ V  V /| |_| |  _ <| . \ ___) |  __/ ___ \ |___| |___ 
--    \_/\_/  \___/|_| \_\_|\_\____/|_| /_/   \_\____|_____|
--
hl.bind(mod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

hl.bind("$mod&SHIFT" .. " + " .. 1, hl.dsp.window.move(1))
hl.bind("$mod&SHIFT" .. " + " .. 2, hl.dsp.window.move(2))
hl.bind("$mod&SHIFT" .. " + " .. 3, hl.dsp.window.move(3))
hl.bind("$mod&SHIFT" .. " + " .. 4, hl.dsp.window.move(4))
hl.bind("$mod&SHIFT" .. " + " .. 5, hl.dsp.window.move(5))
hl.bind("$mod&SHIFT" .. " + " .. 6, hl.dsp.window.move(6))
hl.bind("$mod&SHIFT" .. " + " .. 7, hl.dsp.window.move(7))
hl.bind("$mod&SHIFT" .. " + " .. 8, hl.dsp.window.move(8))
hl.bind("$mod&SHIFT" .. " + " .. 9, hl.dsp.window.move(9))
hl.bind("$mod&SHIFT" .. " + " .. 0, hl.dsp.window.move(10))

hl.bind("$mod&CONTROL" .. " + " .. 1, hl.dsp.window.move(1, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 2, hl.dsp.window.move(2, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 3, hl.dsp.window.move(3, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 4, hl.dsp.window.move(4, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 5, hl.dsp.window.move(5, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 6, hl.dsp.window.move(6, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 7, hl.dsp.window.move(7, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 8, hl.dsp.window.move(8, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 9, hl.dsp.window.move(9, { follow = false }))
hl.bind("$mod&CONTROL" .. " + " .. 0, hl.dsp.window.move(10, { follow = false }))

-- special workspaces
hl.bind(mod .. " + " .. "O", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind("$mod&SHIFT" .. " + " .. "O", hl.dsp.window.move("special:scratchpad"))
hl.bind(mod .. " + " .. "T", hl.dsp.workspace.toggle_special("social"))

--  __  __ ___ ____ _____ 
-- |  \/  |_ _/ ___| ____|
-- | |\/| || | |   |  _|  
-- | |  | || | |___| |___ 
-- |_|  |_|___\____|_____|

hl.bind(mod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("$mod&SHIFT" .. " + " .. "mouse_down", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + " .. "mouse_down", hl.dsp.focus({ direction = "up" }))
hl.bind("$mod&SHIFT" .. " + " .. "mouse_up", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + " .. "mouse_up", hl.dsp.focus({ direction = "down" }))

--  _   _ _____ ___ _     ___ _____ ___ _____ ____  
-- | | | |_   _|_ _| |   |_ _|_   _|_ _| ____/ ___| 
-- | | | | | |  | || |    | |  | |  | ||  _| \___ \ 
-- | |_| | | |  | || |___ | |  | |  | || |___ ___) |
--  \___/  |_| |___|_____|___| |_| |___|_____|____/ 

hl.bind("$mod&SHIFT" .. " + " .. "L", hl.dsp.exec_cmd("~/.config/hypr/scripts/lock.sh"))
hl.bind(mod .. " + " .. "RETURN", hl.dsp.exec_cmd("alacritty"))

--terminal accesable in all bind maps
hl.bind("$mod&SHIFT" .. " + " .. "RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind(mod .. " + " .. "R", hl.dsp.exec_cmd("wofi --show run"))
hl.bind(mod .. " + " .. "SHIFT" .. " + " .. "R", hl.dsp.exec_cmd("wofi --show run"))
hl.bind(mod .. " + " .. "V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu| cliphist decode| wl-copy"))
hl.bind(mod .. " + " .. "CONTROL" .. " + " .. "V", hl.dsp.exec_cmd("cliphist wipe & notify-send Wiped clipboard list:  $(cliphist list)"))
hl.bind("Print", hl.dsp.exec_cmd("grim"))
hl.bind("SHIFT" .. " + " .. "Print", hl.dsp.exec_cmd("grim -g $(slurp -w 0)-| swappy -f-"))

--  ____  _   _ ____  __  __    _    ____  ____  
-- / ___|| | | | __ )|  \/  |  / \  |  _ \/ ___| 
-- \___ \| | | |  _ \| |\/| | / _ \ | |_) \___ \ 
--  ___) | |_| | |_) | |  | |/ ___ \|  __/ ___) |
-- |____/ \___/|____/|_|  |_/_/   \_\_|   |____/ 

-- -- Applications map
-- hl.bind(mod .. " + " .. "A", hl.dsp.submap("APPS"))
--
-- --activate APPlications submap
-- hl.define_submap("APPS", function()
--     hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
-- end)
--
-- -- Window size
-- hl.bind(mod .. " + " .. "S", hl.dsp.submap("RESIZE"))
--
-- --Window Size
-- hl.define_submap("RESIZE", function()
--     hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
-- end)
--
-- -- Move window
-- hl.bind(mod .. " + " .. "M", hl.dsp.submap("MOVE"))
-- hl.define_submap("MOVE", function()
--     hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
-- end)
--
-- -- Workspaces manipulation
-- hl.bind(mod .. " + " .. "W", hl.dsp.submap("WORKSPACE"))
-- hl.define_submap("WORKSPACE", function()
--     hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
-- end)
--
-- -- Cursor manipulation
-- hl.bind(mod .. " + " .. "C", hl.dsp.submap("CURSOR"))
-- hl.define_submap("CURSOR", function()
--     hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
-- end)
--
-- -- Player control
-- hl.bind(mod .. " + " .. "P", hl.dsp.submap("PLAYER"), { locked = true })
-- hl.define_submap("PLAYER", function()
--     hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
-- end)
--
-- -- wallpaper control
-- hl.bind(mod .. " + " .. "B", hl.dsp.submap("BACKGROUND"))
-- hl.define_submap("BACKGROUND", function()
--     hl.bind("ESCAPE", hl.dsp.submap("reset"), { locked = true })
-- end)
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
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- SCREEN
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%+"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 1%-"), { locked = true })
