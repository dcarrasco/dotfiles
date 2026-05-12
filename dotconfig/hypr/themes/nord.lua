--   _   _               _             _
--  | \ | | ___  _ __ __| |   ___ ___ | | ___  _ __ ___
--  |  \| |/ _ \| '__/ _` |  / __/ _ \| |/ _ \| '__/ __|
--  | |\  | (_) | | | (_| | | (_| (_) | | (_) | |  \__ \
--  |_| \_|\___/|_|  \__,_|  \___\___/|_|\___/|_|  |___/


local colors = {
  -- Polar Night
  nord0 = "2E3440",
  nord1 = "3B4252",
  nord2 = "434C5E",
  nord3 = "4C566A",
  -- Snow Storm
  nord4 = "D8DEE9",
  nord5 = "E5E9F0",
  nord6 = "ECEFF4",
  -- Frost
  nord7 = "8FBCBB",
  nord8 = "88C0D0",
  nord9 = "81A1C1",
  nord10 = "5E81AC",
  -- Aurora
  nord11 = "BF616A",
  nord12 = "D08770",
  nord13 = "EBCB8B",
  nord14 = "A3BE8C",
  nord15 = "B48EAD",
}

HYPR.theme = {
  color_active_border_1       = HYPR.hex_rgb(colors.nord8),
  color_active_border_2       = HYPR.hex_rgb(colors.nord10),
  color_inactive_border       = HYPR.hex_rgb(colors.nord3),
  color_group_border_active   = HYPR.hex_rgb(colors.nord12),
  color_group_border_inactive = HYPR.hex_rgb(colors.nord3),
  color_groupbar_active       = HYPR.hex_rgb(colors.nord12),
  color_groupbar_inactive     = HYPR.hex_rgb(colors.nord3),
  color_text_groupbar         = HYPR.hex_rgb(colors.nord4),
  color_shadow                = HYPR.hex_rgba(colors.nord0, "CC"),
  color_shadow_inactive       = HYPR.hex_rgba("000000", "00"),
}
