--               _            _             _
--    __ _ _   _| |_ ___  ___| |_ __ _ _ __| |_
--   / _` | | | | __/ _ \/ __| __/ _` | '__| __|
--  | (_| | |_| | || (_) \__ \ || (_| | |  | |_
--   \__,_|\__,_|\__\___/|___/\__\__,_|_|   \__|

-- Execute your favorite apps at launch
hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
  -- hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland DISPLAY XAUTHORITY")
  -- hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  -- hl.exec_cmd("systemctl --user start graphical-session.target")
  -- hl.exec_cmd("qs")
  hl.exec_cmd(HYPR.fn.app("wlsunset -l -33 -L -70"))
  hl.exec_cmd(HYPR.fn.app("dropbox start"))
  hl.exec_cmd(HYPR.fn.app("brightnessctl set 50%"))

  -- gnome-keyring: pkcs11/secrets are already unlocked via GDM's PAM
  -- (pam_gnome_keyring auto_start) and socket-activated by systemd, but that
  -- unit only starts with --components="pkcs11,secrets". Join the running
  -- daemon and add the ssh component, then export SSH_AUTH_SOCK so it's
  -- visible to the systemd user session and dbus-activated services.
  hl.exec_cmd("bash -c 'eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh); systemctl --user import-environment SSH_AUTH_SOCK; dbus-update-activation-environment --systemd SSH_AUTH_SOCK'")

  -- Those processes are being started by systemd
  -- hl.exec_cmd("systemctl --user start hyprpolkitagent")
  -- hl.exec_cmd("waybar")
  -- hl.exec_cmd("hypridle")
  -- hl.exec_cmd("hyprpaper")
  -- hl.exec_cmd("mako")
  --
  -- hl.exec_cmd("xhost +SI:localuser:root")
  -- hl.exec_cmd("/usr/bin/variety")
  -- hl.exec_cmd("flameshot")
end)
