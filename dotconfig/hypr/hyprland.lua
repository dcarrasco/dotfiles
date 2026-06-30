--   _   _                  _                 _
--  | | | |_   _ _ __  _ __| | __ _ _ __   __| |
--  | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
--  |  _  | |_| | |_) | |  | | (_| | | | | (_| |
--  |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|


-- Please note not all available settings / options are set here.
-- For a full list, see the wiki
HYPR = {}
require("lua/functions")

-- Default Apps
HYPR.scripts_path = "$HOME/.config/hypr/scripts"

HYPR.apps = {
  terminal  = "uwsm app -- kitty -d ~",
  terminal2 = "uwsm app -- alacritty",
  tmux      = "uwsm app -- kitty -d ~ bash -c \"tmux attach || tmux new -s Work\"",
  browser   = "uwsm app -- brave-browser --password-store=basic",
  browser2  = "uwsm app -- firefox",
  files     = "uwsm app -- thunar ~",
  logout    = "uwsm app -- wlogout -b 5",
  launcher  = "uwsm app -- rofi -show drun -show-icons -theme layout-apps",
  launcher_run = "uwsm app -- rofi -show run -config $HOME/.config/rofi/themes/dmenu.rasi -run-shell-command 'kitty --hold {cmd}'",
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

