--    ____      _                        _             _       _   _
--   / ___|__ _| |_ _ __  _   _  ___ ___(_)_ __       | | __ _| |_| |_ ___
--  | |   / _` | __| '_ \| | | |/ __/ __| | '_ \ _____| |/ _` | __| __/ _ \
--  | |__| (_| | |_| |_) | |_| | (_| (__| | | | |_____| | (_| | |_| ||  __/
--   \____\__,_|\__| .__/ \__,_|\___\___|_|_| |_|     |_|\__,_|\__|\__\___|
--             _   |_|
--    ___ ___ | | ___  _ __ ___
--   / __/ _ \| |/ _ \| '__/ __|
--  | (_| (_) | | (_) | |  \__ \
--   \___\___/|_|\___/|_|  |___/

local catpuccin_latte_colors = {
  rosewater = "rgb(dc8a78)", rosewaterAlpha = "dc8a78",
  flamingo = "rgb(dd7878)", flamingoAlpha = "dd7878",
  pink     = "rgb(ea76cb)", pinkAlpha     = "ea76cb",
  mauve    = "rgb(8839ef)", mauveAlpha    = "8839ef",
  red      = "rgb(d20f39)", redAlpha      = "d20f39",
  maroon   = "rgb(e64553)", maroonAlpha   = "e64553",
  peach    = "rgb(fe640b)", peachAlpha    = "fe640b",
  yellow   = "rgb(df8e1d)", yellowAlpha   = "df8e1d",
  green    = "rgb(40a02b)", greenAlpha    = "40a02b",
  teal     = "rgb(179299)", tealAlpha     = "179299",
  sky      = "rgb(04a5e5)", skyAlpha      = "04a5e5",
  sapphire = "rgb(209fb5)", sapphireAlpha = "209fb5",
  blue     = "rgb(1e66f5)", blueAlpha     = "1e66f5",
  lavender = "rgb(7287fd)", lavenderAlpha = "7287fd",
  text     = "rgb(4c4f69)", textAlpha     = "4c4f69",
  subtext1 = "rgb(5c5f77)", subtext1Alpha = "5c5f77",
  subtext0 = "rgb(6c6f85)", subtext0Alpha = "6c6f85",
  overlay2 = "rgb(7c7f93)", overlay2Alpha = "7c7f93",
  overlay1 = "rgb(8c8fa1)", overlay1Alpha = "8c8fa1",
  overlay0 = "rgb(9ca0b0)", overlay0Alpha = "9ca0b0",
  surface2 = "rgb(acb0be)", surface2Alpha = "acb0be",
  surface1 = "rgb(bcc0cc)", surface1Alpha = "bcc0cc",
  surface0 = "rgb(ccd0da)", surface0Alpha = "ccd0da",
  base     = "rgb(eff1f5)", baseAlpha     = "eff1f5",
  mantle   = "rgb(e6e9ef)", mantleAlpha   = "e6e9ef",
  crust    = "rgb(dce0e8)", crustAlpha    = "dce0e8",
}

THEME_COLORS["color_active_border_1"]       = catpuccin_latte_colors["sky"]
THEME_COLORS["color_active_border_2"]       = catpuccin_latte_colors["lavender"]
THEME_COLORS["color_inactive_border"]       = catpuccin_latte_colors["overlay0"]
THEME_COLORS["color_group_border_active"]   = catpuccin_latte_colors["peach"]
THEME_COLORS["color_group_border_inactive"] = catpuccin_latte_colors["overlay0"]
THEME_COLORS["color_groupbar_active"]       = "rgba(" .. catpuccin_latte_colors["peachAlpha"] .. "CC)"
THEME_COLORS["color_groupbar_inactive"]     = "rgba(" .. catpuccin_latte_colors["overlay0Alpha"] .. "77)"
THEME_COLORS["color_text_groupbar"]         = catpuccin_latte_colors["$surface0"]
THEME_COLORS["color_shadow"]                = "rgba(" .. catpuccin_latte_colors["textAlpha"] .. "CC)"
THEME_COLORS["color_shadow_inactive"]       = "rgba(00000000)"
