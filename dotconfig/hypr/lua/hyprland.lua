--   _   _                  _                 _
--  | | | |_   _ _ __  _ __| | __ _ _ __   __| |
--  | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
--  |  _  | |_| | |_) | |  | | (_| | | | | (_| |
--  |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|


-- Please note not all available settings / options are set here.
-- For a full list, see the wiki
HYPR = {}
require("functions")

-- Default Apps
HYPR.scripts_path = "$HOME/.config/hypr/scripts"

HYPR.apps = {
  terminal  = "kitty -d ~",
  terminal2 = "alacritty",
  browser   = "brave-browser --password-store=basic",
  browser2  = "firefox",
  files     = "thunar ~",
  logout    = "wlogout -b 5",
  launcher  = "rofi -show drun -show-icons -theme layout-apps",
  launcher_run = "rofi -show run -config $HOME/.config/rofi/themes/dmenu.rasi -run-shell-command 'kitty --hold {cmd}'",
}

-- Source a file (multi-file configs)
require("envs")
require("monitors")
require("autostart")
require("keybinds")
require("theme")
require("themes/" .. HYPR.theme_name)
require("input")
require("looknfeel")
require("rules")

