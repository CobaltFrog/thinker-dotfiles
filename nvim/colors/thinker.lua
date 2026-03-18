vim.cmd("highlight clear")
vim.g.colors_name = "thinker"
vim.o.background = "dark"

local background_normal = "#2c2a24"
local background_light = "#3a372f"
local background_dark = "#14161B"

local foreground_normal = "#fbad30"
local foreground_dark = "#cc820c"
local foreground_light = "#fac269"

local second_foreground_normal = "#36d67b"
local second_foreground_light = "#61f2a0"
local second_foreground_dark = "#09963b"

local accent_normal = "#4a9191"
local accent_light = "#73e6e6"
local accent_dark = "#0e9c9c"

local text_normal = "#faf7f2"
local text_light = "#ffffff"
local text_dark = "#635d52"

local error_color = "#bd3131"
local warning_color = "#ffff32"
local success_color = "#31bd38"

-- idividual for nvim config
local code_statement = "#9293fc"
local code_preroc = "#ff9c9f"

local function set(group_arg, opts_arg)
    vim.api.nvim_set_hl(0, group_arg, opts_arg)
end

-- set highlight
local function set_hl(group_arg, fg_arg, bg_arg, opts_arg)
    opts = {}

    if type(opts_arg) == "table" then -- copy original table
        for k, v in pairs(opts_arg) do
            opts[k] = v
        end
    end

    if fg_arg ~= nil then opts.fg = fg_arg end -- append foreground..
    if bg_arg ~= nil then opts.bg = bg_arg end -- ..and background colors

    vim.api.nvim_set_hl(0, group_arg, opts)
end

-- set only foreground
local function set_fg(group_arg, fg_arg, opts_arg)
    opts = {}

    if fg_arg ~= nil then opts.fg = fg_arg end

    if type(opts_arg) == "table" then
        for k, v in pairs(opts_arg) do
            opts[k] = v
        end
    end

    vim.api.nvim_set_hl(0, group_arg, opts)
end

-- set only background
local function set_bg(group_arg, bg_arg, opts_arg)
    opts = {}

    if bg_arg ~= nil then opts.bg = bg_arg end

    if type(opts_arg) == "table" then
        for k, v in pairs(opts_arg) do
            opts[k] = v
        end
    end

    vim.api.nvim_set_hl(0, group_arg, opts)
end

-- link highlight color to another
local function set_ln(group_arg, src_group)
    vim.api.nvim_set_hl(0, group_arg, { link = src_group })
end

--== THINKER_THEME ==--
set_hl("Normal", text_normal, background_normal,  { ctermfg = 15, ctermbg = 236 })

-- cursor
set("Cursor", { reverse = true, bold = true })
set("lCursor", { reverse = true, bold = true })

-- main look
set_hl("StatusLine", text_normal, background_dark)
set_bg("CursorLine", background_light)
set_bg("CursorColumn", background_light)
set_bg("ColorColumn", foreground_light)
set_fg("ModeMsg", second_foreground_normal)

-- line numbers
set_hl("CursorLineNr", accent_light, background_light, { bold = true })
set_fg("LineNr", text_dark)

-- files
set_fg("Directory", foreground_normal, { bold = true })

-- misc
set_fg("ErrorMsg", error_color, { bold = true })

-- code
set_fg("String", second_foreground_normal, { ctermfg = 83 })
set_fg("Function", foreground_light, { bold = true, ctermfg = 31 })
set_fg("Operator", text_light)
set_fg("Identifier", accent_light)
set_fg("Statement", code_statement)
set_fg("PreProc", code_preroc)
set_fg("Type", accent_normal, { bold = true})
set_fg("Typedef", accent_normal)
set_fg("Special", accent_dark)
set_fg("Constant", foreground_normal)
set_fg("Character", second_foreground_light)
set_fg("Comment", second_foreground_dark, { italic = true })

set_fg("Added", success_color)
set_fg("Changed", accent_light)
set_fg("Removed", error_color)

set_fg("Todo", "#00ff00")

set_ln("Number", "Constant")
set_ln("Float", "Constant")
