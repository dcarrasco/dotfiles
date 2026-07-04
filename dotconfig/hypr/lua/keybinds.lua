--    _  __          _     _           _
--   | |/ /___ _   _| |__ (_)_ __   __| |___
--   | ' // _ \ | | | '_ \| | '_ \ / _` / __|
--   | . \  __/ |_| | |_) | | | | | (_| \__ \
--   |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
--             |___/

-- local screenshots = "$HOME/Imágenes/Screenshots"
HYPR.mainMod = "SUPER"

-- Programs
local appBinds = {
  { key = "RETURN", dsp = HYPR.apps.terminal, desc = "Open terminal" },
  { key = "ALT + RETURN", dsp = HYPR.apps.tmux, desc = "Open tmux in terminal" },
  { key = "SHIFT + RETURN", dsp = HYPR.apps.terminal2, desc = "Open alternate terminal" },
  { key = "B", dsp = HYPR.apps.browser, desc = "Open browser" },
  { key = "ALT + B", dsp = HYPR.apps.browser2, desc = "Open alternate browser" },
  { key = "F", dsp = HYPR.apps.files, desc = "Open file manager" },
  { key = "E", dsp = HYPR.apps.files, desc = "Open file manager" },
  { key = "V", dsp = HYPR.fn.scripts("hypr-start-vm windows"), desc = "Open Windows 11" },
  { key = "ALT + V", dsp = "virt-manager", desc = "Open virt-manager" },
  { mod = "", key = "XF86Calculator", dsp = "gnome-calculator", desc = "Open calculator" },
  { mod = "", key = "XF86Favorites", dsp = HYPR.apps.browser, desc = "Open browser" },
}

HYPR.fn.keybind(appBinds)
HYPR.fn.keybind(require("lua/keybinds/utilities"))
HYPR.fn.keybind(require("lua/keybinds/tiling"))
HYPR.fn.keybind(require("lua/keybinds/media"))
