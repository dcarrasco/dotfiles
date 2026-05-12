--  _   _               _             _
--  | \ | | ___  _ __ __| |   ___ ___ | | ___  _ __ ___
--  |  \| |/ _ \| '__/ _` |  / __/ _ \| |/ _ \| '__/ __|
--  | |\  | (_) | | | (_| | | (_| (_) | | (_) | |  \__ \
--  |_| \_|\___/|_|  \__,_|  \___\___/|_|\___/|_|  |___/


local nord_frost_colors = {
  -- Polar Night
  nord0 = "rgb(2E3440)", nord0_alpha = "2E3440",
  nord1 = "rgb(3B4252)",
  nord2 = "rgb(434C5E)",
  nord3 = "rgb(4C566A)",
  -- Snow Storm
  nord4 = "rgb(D8DEE9)",
  nord5 = "rgb(E5E9F0)",
  nord6 = "rgb(ECEFF4)",
  -- Frost
  nord7 = "rgb(8FBCBB)",
  nord8 = "rgb(88C0D0)",
  nord9 = "rgb(81A1C1)",
  nord10 = "rgb(5E81AC)",
  -- Aurora
  nord11 = "rgb(BF616A)",
  nord12 = "rgb(D08770)",
  nord13 = "rgb(EBCB8B)",
  nord14 = "rgb(A3BE8C)",
  nord15 = "rgb(B48EAD)",
}

THEME_COLORS["color_active_border_1"]       = nord_frost_colors["nord8"]
THEME_COLORS["color_active_border_2"]       = nord_frost_colors["nord10"]
THEME_COLORS["color_inactive_border"]       = nord_frost_colors["nord3"]
THEME_COLORS["color_group_border_active"]   = nord_frost_colors["nord12"]
THEME_COLORS["color_group_border_inactive"] = nord_frost_colors["nord3"]
THEME_COLORS["color_groupbar_active"]       = nord_frost_colors["nord12"]
THEME_COLORS["color_groupbar_inactive"]     = nord_frost_colors["nord3"]
THEME_COLORS["color_text_groupbar"]         = nord_frost_colors["nord4"]
THEME_COLORS["color_shadow"]                = "rgba(" .. nord_frost_colors["nord0_alpha"] .. "CC)"
THEME_COLORS["color_shadow_inactive"]       = "rgba(00000000)"
