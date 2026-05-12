--    _  __          _     _           _
--   | |/ /___ _   _| |__ (_)_ __   __| |___
--   | ' // _ \ | | | '_ \| | '_ \ / _` / __|
--   | . \  __/ |_| | |_) | | | | | (_| \__ \
--   |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
--             |___/

-- See https://wiki.hyprland.org/Configuring/Keywords/ for more
-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

-- local screenshots = "$HOME/Imágenes/Screenshots"

-- Programs
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(APPS["terminal"]), { description = "Open terminal" })
hl.bind("SUPER + ALT + RETURN", hl.dsp.exec_cmd(APPS["terminal2"]), { description = "Open alternate terminal" })
hl.bind("SUPER + B", hl.dsp.exec_cmd(APPS["browser"]), { description = "Open browser" })
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd(APPS["browser2"]), { description = "Open alternate browser" })
hl.bind("SUPER + F", hl.dsp.exec_cmd(APPS["files"]), { description = "Open file manager" })
hl.bind("SUPER + V", hl.dsp.exec_cmd(APPS["scripts_path"] .. "hypr-start-vm windows"), { description = "Open Windows 11" })
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd("virt-manager"), { description = "Open virt-manager" })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"), { description = "Open calculator" })
hl.bind("XF86Favorites", hl.dsp.exec_cmd(APPS["browser"]), { description = "Open Firefox" })

require("keybinds/utilities")
require("keybinds/tiling")
require("keybinds/media")
