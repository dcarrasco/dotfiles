--   __  __             _ _
--  |  \/  | ___  _ __ (_) |_ ___  _ __ ___
--  | |\/| |/ _ \| '_ \| | __/ _ \| '__/ __|
--  | |  | | (_) | | | | | || (_) | |  \__ \
--  |_|  |_|\___/|_| |_|_|\__\___/|_|  |___/

hl.env("GDK_SCALE", "1.25")

-- See https://wiki.hyprland.org/Configuring/Monitors/
-- monitor=name,resolution,position,scale
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1.33 })
hl.monitor({ output = "DP-8", mode = "3840x2160", position = "2240x0", scale = 1.25 })
hl.monitor({ output = "Virtual-1", mode = "1920x1080", position = "auto", scale = 1 })

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "DP-8", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "DP-8", persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "DP-8", persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "DP-8", persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "DP-8", persistent = true })

