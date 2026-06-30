--       _                      _                   _
--    __| |_ __ __ _  ___ _   _| | __ _    ___ ___ | | ___  _ __ ___
--   / _` | '__/ _` |/ __| | | | |/ _` |  / __/ _ \| |/ _ \| '__/ __|
--  | (_| | | | (_| | (__| |_| | | (_| | | (_| (_) | | (_) | |  \__ \
--   \__,_|_|  \__,_|\___|\__,_|_|\__,_|  \___\___/|_|\___/|_|  |___/
--

local colors = {
  background = "282A36",
  foreground = "F8F8F2",
  selection  = "44475A",
  comment    = "6272A4",
  red        = "FF5555",
  orange     = "FFB86C",
  yellow     = "F1FA8C",
  green      = "50FA7B",
  purple     = "BD93F9",
  cyan       = "8BE9FD",
  pink       = "FF79C6",
  accent     = "$purple",
}

return {
  color_active_border_1       = HYPR.fn.hex_rgb(colors.purple),
  color_active_border_2       = HYPR.fn.hex_rgb(colors.pink),
  color_inactive_border       = HYPR.fn.hex_rgb(colors.selection),
  color_group_border_active   = HYPR.fn.hex_rgb(colors.orange),
  color_group_border_inactive = HYPR.fn.hex_rgb(colors.selection),
  color_groupbar_active       = HYPR.fn.hex_rgb(colors.orange),
  color_groupbar_inactive     = HYPR.fn.hex_rgb(colors.selection),
  color_text_groupbar         = HYPR.fn.hex_rgb(colors.comment),
  color_shadow                = HYPR.fn.hex_rgba(colors.background, "CC"),
  color_shadow_inactive       = HYPR.fn.hex_rgba("000000", "00"),
}
