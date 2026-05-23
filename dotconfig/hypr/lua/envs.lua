--   ___ _ ____   _____
--  / _ \ '_ \ \ / / __|
--  |  __/ | | \ V /\__ \
--  \___|_| |_|\_/ |___/

-- Some default env vars.
-- hl.env("GTK_THEME", "adw-gtk3")
hl.env("HYPRCURSOR_THEME", "macOS-BigSur")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("XCURSOR_THEME", "macOS-BigSur")
hl.env("XCURSOR_SIZE", "32")

-- GDK
hl.env("GDK_BACKEND", "wayland,x11,*")

-- XDG Desktop Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

