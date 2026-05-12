--       _                      _                   _
--    __| |_ __ __ _  ___ _   _| | __ _    ___ ___ | | ___  _ __ ___
--   / _` | '__/ _` |/ __| | | | |/ _` |  / __/ _ \| |/ _ \| '__/ __|
--  | (_| | | | (_| | (__| |_| | | (_| | | (_| (_) | | (_) | |  \__ \
--   \__,_|_|  \__,_|\___|\__,_|_|\__,_|  \___\___/|_|\___/|_|  |___/
--

local dracula_colors = {
  background = "rgb(282A36)", backgroundAlpha = "282A36",
  foreground = "rgb(F8F8F2)", foregroundAlpha = "F8F8F2",
  selection  = "rgb(44475A)", selectionAlpha = "44475A",
  comment    = "rgb(6272A4)", commentAlpha = "6272A4",
  red        = "rgb(FF5555)", redAlpha = "FF5555",
  orange     = "rgb(FFB86C)", orangeAlpha = "FFB86C",
  yellow     = "rgb(F1FA8C)", yellowAlpha = "F1FA8C",
  green      = "rgb(50FA7B)", greenAlpha = "50FA7B",
  purple     = "rgb(BD93F9)", purpleAlpha = "BD93F9",
  cyan       = "rgb(8BE9FD)", cyanAlpha = "8BE9FD",
  pink       = "rgb(FF79C6)", pinkAlpha = "FF79C6",
  accent     = "$purple", accentAlpha = "$purpleRaw",
}

THEME_COLORS["color_active_border_1"]       = dracula_colors["purple"]
THEME_COLORS["color_active_border_2"]       = dracula_colors["pink"]
THEME_COLORS["color_inactive_border"]       = dracula_colors["selection"]
THEME_COLORS["color_group_border_active"]   = dracula_colors["orange"]
THEME_COLORS["color_group_border_inactive"] = dracula_colors["selection"]
THEME_COLORS["color_groupbar_active"]       = dracula_colors["orange"]
THEME_COLORS["color_groupbar_inactive"]     = dracula_colors["selection"]
THEME_COLORS["color_text_groupbar"]         = dracula_colors["comment"]
THEME_COLORS["color_shadow"]                = "rgba(" .. dracula_colors["backgroundAlpha"] .. "CC)"
THEME_COLORS["color_shadow_inactive"]       = "rgba(00000000)"
