--   __  __             _ _
--  |  \/  | ___  _ __ (_) |_ ___  _ __ ___
--  | |\/| |/ _ \| '_ \| | __/ _ \| '__/ __|
--  | |  | | (_) | | | | | || (_) | |  \__ \
--  |_|  |_|\___/|_| |_|_|\__\___/|_|  |___/

hl.env("GDK_SCALE", "1.25")

-- See https://wiki.hyprland.org/Configuring/Monitors/
-- monitor=name,resolution,position,scale
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-8", mode = "3840x2160", position = "2240x0", scale = 1.25 })
hl.monitor({ output = "Virtual-1", mode = "1920x1080", position = "auto", scale = 1 })

for i = 1, 5 do
  hl.workspace_rule({ workspace = i, monitor = "eDP-1", persistent = true })
end

for i = 6, 10 do
  hl.workspace_rule({ workspace = i % 10, monitor = "DP-8", persistent = true })
end

