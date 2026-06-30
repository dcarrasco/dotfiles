--   _             _               __           _
--  | | ___   ___ | | __  _ __    / _| ___  ___| |
--  | |/ _ \ / _ \| |/ / | '_ \  | |_ / _ \/ _ \ |
--  | | (_) | (_) |   <  | | | | |  _|  __/  __/ |
--  |_|\___/ \___/|_|\_\ |_| |_| |_|  \___|\___|_|


hl.config({
  general = {
    -- See https://wiki.hyprland.org/Configuring/Variables/ for more
    border_size = 3,
    gaps_in = 5,
    gaps_out = 10,
    col = {
      -- col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
      active_border = { colors = { HYPR.theme.color_active_border_1, HYPR.theme.color_active_border_2 }, angle = 45 },
      inactive_border = HYPR.theme.color_inactive_border,
    },

    -- layout = "dwindle"
    layout = "master",
    -- layout = "monocle",

    resize_on_border = true,
    hover_icon_on_border = true,

    snap = {
        enabled = false,
        window_gap = 20,
    }
  },

  group = {
    col = {
      border_active = HYPR.theme.color_group_border_active,
      border_inactive = HYPR.theme.color_group_border_inactive,
    },
    groupbar = {
      enabled = true,
      gradients = true,
      rounding = 3,
      gradient_rounding = 15,
      font_family = "Adwaita Sans",
      font_size = 15,
      height = 20,
      stacked = false,
      render_titles = true,
      text_color = HYPR.theme.color_text_groupbar,
      col = {
        active = HYPR.theme.color_groupbar_active,
        inactive = HYPR.theme.color_groupbar_inactive,
      },
      blur = true,
    },
  },

  decoration = {
    -- See https://wiki.hyprland.org/Configuring/Variables/ for more
    rounding = 12,
    rounding_power = 4.0,
    dim_modal = true,
    -- dim_inactive = true,
    -- dim_strength = 0.2
    -- inactive_opacity = 0.9
    dim_around = 0.4,

    blur = {
      enabled = true,
      size = 7,
      passes = 2,
      -- ignore_opacity = true
      new_optimizations = true,
    },

    shadow = {
      enabled = true,
      range = 12,
      render_power = 2,
      color = HYPR.theme.color_shadow,
      color_inactive = HYPR.theme.color_shadow_inactive,
      offset = {0, 0},
    },
  },

  dwindle = {
    -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    preserve_split = true, -- you probably want this
    force_split = 2,
    use_active_for_splits = true,
    -- no_gaps_when_only = 0,   # 0 with gaps / 1 no gaps no border / 2 no gaps with border
  },

  master = {
    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    mfact = 0.5,
    new_status = "master",
    -- no_gaps_when_only = 1,   # 0 with gaps / 1 no gaps no border / 2 no gaps with border,
  },

  cursor = {
    no_warps = false,
    persistent_warps = true,
    warp_on_change_workspace = 1,
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    -- disable_hyprland_qtutils_check = true
    font_family = "Mono",
    on_focus_under_fullscreen = 1,
  },

  xwayland = {
    force_zero_scaling = false,
    use_nearest_neighbor = false,
  },

  ecosystem = {
    no_update_news = true,
  }
})


hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } } )
hl.curve("smoothOut", { type = "bezier", points = { {0.5, 0}, {0.99, 0.99} } } )
hl.curve("slow", { type = "bezier", points = { {0, 0.85}, {0.3, 1} } } )
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } } )
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } } )
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } } )
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } } )
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } } )

-- Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
-- enabled = true
-- animation = global, 1, 3, default
--
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "myBezier", style = "popin 80%" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "default", style = "popin 70%" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 5, bezier = "default" })

