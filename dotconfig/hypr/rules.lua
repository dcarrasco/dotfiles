--              _
--   _ __ _   _| | ___  ___
--  | '__| | | | |/ _ \/ __|
--  | |  | |_| | |  __/\__ \
--  |_|   \__,_|_|\___||___/


-- Browsers
hl.window_rule({ match = {class = "^(Brave-browser)$"}, workspace = "1" })
hl.window_rule({ match = {class = "^(brave-browser)$"}, workspace = "1" })
hl.window_rule({ match = {class = "^(brave)$"}, workspace = "1" })
hl.window_rule({ match = {class = "^(firefox)$"}, workspace = "1" })
hl.window_rule({ match = {class = "^(org.mozilla.firefox)$"}, workspace = "1" })
hl.window_rule({ match = {class = "^(Chromium-browser)$"}, workspace = "1" })
hl.window_rule({ match = {class = "^(Org.chromium.Chromium)$"}, workspace = "1" })
-- windowrule = match:class ^(.)$, no_blur # chrome-like browsers no blur menus


-- File Managers
hl.window_rule({ match = {class = "^(thunar)$"}, workspace = "4" })
hl.window_rule({ match = {class = "^(org.gnome.nautilus)$"}, workspace = "4" })


-- virt-manager
hl.window_rule({ match = {class = "^(virt-manager)$"}, workspace = "3" })
hl.window_rule({ match = {class = "^(virt-viewer)$"}, workspace = "3" })
hl.window_rule({ match = {class = "^(virt-viewer)$"}, maximize = true })
hl.window_rule({ match = {class = "^(virt-viewer)$"}, fullscreen = true })
hl.window_rule({ match = {class = "^(virt-viewer)$"}, fullscreen_state = "-1 2" })


-- rofi / wofi
hl.window_rule({ match = {class = "^(Rofi)$"}, pin = true })
hl.window_rule({ match = {class = "^(wofi)$"}, pin = true })
hl.window_rule({ match = {class = "^(wofi)$"}, dim_around = true })
hl.layer_rule({ match = {namespace = "rofi"}, blur = true })
hl.layer_rule({ match = {namespace = "rofi"}, no_anim = true })
hl.layer_rule({ match = {namespace = "rofi"}, dim_around = true })


-- Variety
hl.window_rule({ match = {class = "^(variety)$"}, float = true })
hl.window_rule({ match = {class = "^(variety)$", title = "^(Imágenes de Variety)$"}, size = "100% 5%" })
hl.window_rule({ match = {class = "^(variety)$", title = "^(Imágenes de Variety)$"}, move = "0% 90%" })


-- Waybar
hl.layer_rule({ match = {namespace = "waybar"}, blur = true })
hl.layer_rule({ match = {namespace = "waybar"}, ignore_alpha = 0 })


-- Aesthtics
hl.layer_rule({ match = {namespace = "logout_dialog"}, blur = true })
hl.layer_rule({ match = {namespace = "wallpaper"}, no_anim = true })
hl.layer_rule({ match = {namespace = "notifications"}, animation = "slide right" })
hl.layer_rule({ match = {namespace = "notifications"}, blur = true })
hl.layer_rule({ match = {namespace = "notifications"}, ignore_alpha = 0 })
hl.layer_rule({ match = {namespace = "hyprpicker"}, no_anim = true })
hl.layer_rule({ match = {namespace = "selection"}, no_anim = true })
-- no gaps, borders, rounding on fullscreen windows -----------------------------------
-- workspace = f[1], gapsout:0, gapsin:0
-- windowrule = border_size 0, match:float 0, match:workspace f[1]
-- windowrule = rounding 0, match:float 0, match:workspace f[1]


-- System
hl.window_rule({ match = {class = "^(hypr-sys-menu)$"}, float = true })
hl.window_rule({ match = {class = "^(hypr-sys-menu)$"}, center = true })
hl.window_rule({ match = {class = "^(hypr-sys-menu)$"}, size = "1000 700" })
hl.window_rule({ match = {modal = true}, float = true})
hl.window_rule({ match = {class = "^(xdg-desktop-portal-gtk)$"}, float = true })
-- Dialogo para grabar en brave desde google, es flotante
hl.window_rule({ match = {class = "^(brave)$", title = "^(.*desea guardar)$"}, float = true })
hl.window_rule({ match = {class = "^(brave)$", title = "^(.*desea abrir)$"}, float = true })
hl.window_rule({ match = {class = "^(thunar)$", title = "^(Renombrar .*)$"}, float = true })


-- Others
hl.window_rule({ match = {class = "^(org.gnome.Calculator)$"}, float = true })
hl.window_rule({ match = {class = "steam_proton"}, tile = true })
hl.window_rule({ match = {class = "(Gaia Sky)"}, tile = true })
hl.window_rule({ match = {class = "^(dosbox)$"}, float = true })
-- windowrule = match:class ^(org.dosbox-staging.dosbox-staging)$, float on, size 70% 70%
hl.window_rule({ match = {class = "^(io.github.Bella)$"}, float = true })
hl.window_rule({ match = {class = "^(org.gnome.World.PikaBackup)$"}, float = true })


-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- no gaps, borders, rounding on tiled windows when there's only one (w[t1]) ----------
-- workspace = w[t1], gapsout:0, gapsin:0
-- windowrule = bordersize 0, floating:0, onworkspace:w[t1]
-- windowrule = rounding 0, floating:0, onworkspace:w[t1]
-- no gaps, borders, rounding on grouped windows when there's only one (w[tg1]) -------
-- workspace = w[tg1], gapsout:0, gapsin:0
-- windowrule = bordersize 0, floating:0, onworkspace:w[tg1]
-- windowrule = rounding 0, floating:0, onworkspace:w[tg1]

