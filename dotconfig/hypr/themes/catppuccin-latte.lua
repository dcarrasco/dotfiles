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

local colors = {
  rosewater = "dc8a78",
  flamingo  = "dd7878",
  pink      = "ea76cb",
  mauve     = "8839ef",
  red       = "d20f39",
  maroon    = "e64553",
  peach     = "fe640b",
  yellow    = "df8e1d",
  green     = "40a02b",
  teal      = "179299",
  sky       = "04a5e5",
  sapphire  = "209fb5",
  blue      = "1e66f5",
  lavender  = "7287fd",
  text      = "4c4f69",
  subtext1  = "5c5f77",
  subtext0  = "6c6f85",
  overlay2  = "7c7f93",
  overlay1  = "8c8fa1",
  overlay0  = "9ca0b0",
  surface2  = "acb0be",
  surface1  = "bcc0cc",
  surface0  = "ccd0da",
  base      = "eff1f5",
  mantle    = "e6e9ef",
  crust     = "dce0e8",
}

HYPR.theme = {
  color_active_border_1       = HYPR.hex_rgb(colors.sky),
  color_active_border_2       = HYPR.hex_rgb(colors.lavender),
  color_inactive_border       = HYPR.hex_rgb(colors.overlay0),
  color_group_border_active   = HYPR.hex_rgb(colors.peach),
  color_group_border_inactive = HYPR.hex_rgb(colors.overlay0),
  color_groupbar_active       = HYPR.hex_rgba(colors.peach, "CC"),
  color_groupbar_inactive     = HYPR.hex_rgba(colors.overlay0, "77"),
  color_text_groupbar         = HYPR.hex_rgb(colors.surface0),
  color_shadow                = HYPR.hex_rgba(colors.text, "CC"),
  color_shadow_inactive       = HYPR.hex_rgba("000000", "00"),
}
