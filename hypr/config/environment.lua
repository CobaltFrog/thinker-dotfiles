---@module 'hl'

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("__THINKER__CURSOR_SIZE", 15)
hl.env("__THINKER__CURRENT_WALLPAPER_DIR", Thinker.wallpaper.dir)
