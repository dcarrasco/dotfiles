--               _            _             _
--    __ _ _   _| |_ ___  ___| |_ __ _ _ __| |_
--   / _` | | | | __/ _ \/ __| __/ _` | '__| __|
--  | (_| | |_| | || (_) \__ \ || (_| | |  | |_
--   \__,_|\__,_|\__\___/|___/\__\__,_|_|   \__|

-- Execute your favorite apps at launch
hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
  hl.exec_cmd("waybar")
  -- hl.exec_cmd("qs")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("mako")
  hl.exec_cmd("$HOME/.config/hypr/scripts/hypr-set-wallpaper")
  hl.exec_cmd("wlsunset -l -33 -L -70")
  hl.exec_cmd("dropbox start")
  hl.exec_cmd("hypridle")
  --
  -- hl.exec_cmd("xhost +SI:localuser:root")
  -- hl.exec_cmd("/usr/bin/variety")
  -- hl.exec_cmd("flameshot")
end)
