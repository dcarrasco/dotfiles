--    ____      _                        _                   _
--   / ___|__ _| |_ _ __  _   _  ___ ___(_)_ __     ___ ___ | | ___  _ __ ___
--  | |   / _` | __| '_ \| | | |/ __/ __| | '_ \   / __/ _ \| |/ _ \| '__/ __|
--  | |__| (_| | |_| |_) | |_| | (_| (__| | | | | | (_| (_) | | (_) | |  \__ \
--   \____\__,_|\__| .__/ \__,_|\___\___|_|_| |_|  \___\___/|_|\___/|_|  |___/
--                 |_|

local catpuccin_colors = {
  rosewater = "rgb(f5e0dc)", rosewaterAlpha = "f5e0dc",
  flamingo = "rgb(f2cdcd)", flamingoAlpha = "f2cdcd",
  pink     = "rgb(f5c2e7)", pinkAlpha     = "f5c2e7",
  mauve    = "rgb(cba6f7)", mauveAlpha    = "cba6f7",
  red      = "rgb(f38ba8)", redAlpha      = "f38ba8",
  maroon   = "rgb(eba0ac)", maroonAlpha   = "eba0ac",
  peach    = "rgb(fab387)", peachAlpha    = "fab387",
  yellow   = "rgb(f9e2af)", yellowAlpha   = "f9e2af",
  green    = "rgb(a6e3a1)", greenAlpha    = "a6e3a1",
  teal     = "rgb(94e2d5)", tealAlpha     = "94e2d5",
  sky      = "rgb(89dceb)", skyAlpha      = "89dceb",
  sapphire = "rgb(74c7ec)", sapphireAlpha = "74c7ec",
  blue     = "rgb(89b4fa)", blueAlpha     = "89b4fa",
  lavender = "rgb(b4befe)", lavenderAlpha = "b4befe",
  text     = "rgb(cdd6f4)", textAlpha     = "cdd6f4",
  subtext1 = "rgb(bac2de)", subtext1Alpha = "bac2de",
  subtext0 = "rgb(a6adc8)", subtext0Alpha = "a6adc8",
  overlay2 = "rgb(9399b2)", overlay2Alpha = "9399b2",
  overlay1 = "rgb(7f849c)", overlay1Alpha = "7f849c",
  overlay0 = "rgb(6c7086)", overlay0Alpha = "6c7086",
  surface2 = "rgb(585b70)", surface2Alpha = "585b70",
  surface1 = "rgb(45475a)", surface1Alpha = "45475a",
  surface0 = "rgb(313244)", surface0Alpha = "313244",
  base     = "rgb(1e1e2e)", baseAlpha     = "1e1e2e",
  mantle   = "rgb(181825)", mantleAlpha   = "181825",
  crust    = "rgb(11111b)", crustAlpha    = "11111b",
}


THEME_COLORS["color_active_border_1"] = catpuccin_colors["sky"]
THEME_COLORS["color_active_border_2"] = catpuccin_colors["lavender"]
THEME_COLORS["color_inactive_border"] = catpuccin_colors["overlay0"]
THEME_COLORS["color_group_border_active"] = catpuccin_colors["peach"]
THEME_COLORS["color_group_border_inactive"] = catpuccin_colors["overlay0"]
THEME_COLORS["color_groupbar_active"] = "rgba(" .. catpuccin_colors["peachAlpha"] .. "CC)"
THEME_COLORS["color_groupbar_inactive"] = "rgba(" .. catpuccin_colors["overlay0Alpha"] .. "77)"
THEME_COLORS["color_text_groupbar"] = catpuccin_colors["$surface0"]
THEME_COLORS["color_shadow"] = "rgba(" .. catpuccin_colors["baseAlpha"] .. "77)"
THEME_COLORS["color_shadow_inactive"] = "rgba(00000077)"
