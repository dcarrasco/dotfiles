--    ____      _                        _                   _
--   / ___|__ _| |_ _ __  _   _  ___ ___(_)_ __     ___ ___ | | ___  _ __ ___
--  | |   / _` | __| '_ \| | | |/ __/ __| | '_ \   / __/ _ \| |/ _ \| '__/ __|
--  | |__| (_| | |_| |_) | |_| | (_| (__| | | | | | (_| (_) | | (_) | |  \__ \
--   \____\__,_|\__| .__/ \__,_|\___\___|_|_| |_|  \___\___/|_|\___/|_|  |___/
--                 |_|

local colors = {
  rosewater = "f5e0dc",
  flamingo = "f2cdcd",
  pink     = "f5c2e7",
  mauve    = "cba6f7",
  red      = "f38ba8",
  maroon   = "eba0ac",
  peach    = "fab387",
  yellow   = "f9e2af",
  green    = "a6e3a1",
  teal     = "94e2d5",
  sky      = "89dceb",
  sapphire = "74c7ec",
  blue     = "89b4fa",
  lavender = "b4befe",
  text     = "cdd6f4",
  subtext1 = "bac2de",
  subtext0 = "a6adc8",
  overlay2 = "9399b2",
  overlay1 = "7f849c",
  overlay0 = "6c7086",
  surface2 = "585b70",
  surface1 = "45475a",
  surface0 = "313244",
  base     = "1e1e2e",
  mantle   = "181825",
  crust    = "11111b",
}


return {
  color_active_border_1       = HYPR.fn.hex_rgb(colors.sky),
  color_active_border_2       = HYPR.fn.hex_rgb(colors.lavender),
  color_inactive_border       = HYPR.fn.hex_rgb(colors.overlay0),
  color_group_border_active   = HYPR.fn.hex_rgb(colors.peach),
  color_group_border_inactive = HYPR.fn.hex_rgb(colors.overlay0),
  color_groupbar_active       = HYPR.fn.hex_rgba(colors.peach, "CC"),
  color_groupbar_inactive     = HYPR.fn.hex_rgba(colors.overlay0, "77"),
  color_text_groupbar         = HYPR.fn.hex_rgb(colors.surface0),
  color_shadow                = HYPR.fn.hex_rgba(colors.base, "AA"),
  color_shadow_inactive       = HYPR.fn.hex_rgba("000000", "77"),
}
