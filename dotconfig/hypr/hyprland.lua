--   _   _                  _                 _
--  | | | |_   _ _ __  _ __| | __ _ _ __   __| |
--  | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
--  |  _  | |_| | |_) | |  | | (_| | | | | (_| |
--  |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|


-- Please note not all available settings / options are set here.
-- For a full list, see the wiki
HYPR = {
  fn = require("lua/functions"),
  use_uwsm = true,
  scripts_path = "$HOME/.config/hypr/scripts",
}

-- Default Apps
HYPR.apps = {
  terminal     = HYPR.fn.app("kitty -d ~"),
  terminal2    = HYPR.fn.app("alacritty"),
  tmux         = HYPR.fn.app("kitty -d ~ bash -c \"tmux attach || tmux new -s Work\""),
  browser      = HYPR.fn.app("brave-browser --password-store=basic"),
  browser2     = HYPR.fn.app("firefox"),
  files        = HYPR.fn.app("thunar ~"),
  logout       = HYPR.fn.app("wlogout -b 5"),
  launcher     = HYPR.fn.app("rofi -show drun -show-icons -theme layout-apps"),
  launcher_run = HYPR.fn.app("rofi -show run -config $HOME/.config/rofi/themes/dmenu.rasi -run-shell-command 'kitty --hold {cmd}'"),
}

-- Source a file (multi-file configs)
require("lua/envs")
require("lua/monitors")
require("lua/autostart")
require("lua/keybinds")
require("lua/theme")
require("lua/input")
require("lua/looknfeel")
require("lua/rules")

