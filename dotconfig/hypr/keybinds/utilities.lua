-- *************************************************************************************************
-- Menus
-- *************************************************************************************************
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd(HYPR.apps.launcher), { description = "Open launcher" })
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd(HYPR.scripts("hypr-sys-menu")), { description = "System menu" })
-- # bindd = SUPER ALT, SPACE, Search files, exec, $APPS["scripts_path"]/hypr-search-home
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd(HYPR.apps.launcher_run), { description = "Open run launcher" })
hl.bind("SUPER + CTRL + V", hl.dsp.exec_cmd(HYPR.scripts("hypr-list-vm")), { description = "List virtual machines" })
hl.bind("SUPER + CTRL + Q", hl.dsp.exec_cmd(HYPR.apps.logout), { description = "System menu" })
hl.bind("SUPER + comma", hl.dsp.exec_cmd(HYPR.scripts("hypr-edit-config")), { description = "Edit config files" })
hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd(HYPR.scripts("hypr-show-keybinds")), { description = "Show keyboard bindings" })
hl.bind("SUPER + F1", hl.dsp.exec_cmd(HYPR.scripts("hypr-show-keybinds")), { description = "Show keyboard bindings" })
hl.bind("Help", hl.dsp.exec_cmd(HYPR.scripts("hypr-show-keybinds")), { description = "Show keyboard bindings" })
hl.bind("SUPER + P", hl.dsp.exec_cmd(HYPR.scripts("hypr-switch-monitor")), { description = "Monitors menu" })
hl.bind("SUPER + ALT + Q", hl.dsp.exit(), { description = "Exit Hyprland" })

-- *************************************************************************************************
-- Aesthetics
-- *************************************************************************************************
-- bindd = SUPER,XF86MonBrightnessDown, Previous wallpaper, exec, variety -p && sleep 1.5 && notify-send "Fondo de pantalla" "Nuevo fondo: $(variety --current 2> /dev/null | xargs -0 -- basename)"
-- bindd = SUPER,XF86MonBrightnessUp, Next wallpaper, exec, variety -n && sleep 1.5 && notify-send "Fondo de pantalla" "Nuevo fondo: $(variety --current 2> /dev/null | xargs -0 -- basename)"
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd(HYPR.scripts("hypr-restore-waybar")), { description = "Reset Waybar" })
hl.bind("SUPER + XF86Favorites", hl.dsp.exec_cmd(HYPR.scripts("hypr-restore-waybar")), { description = "Reset Waybar" })

-- *************************************************************************************************
-- Screenshots
-- *************************************************************************************************
hl.bind("Print", hl.dsp.exec_cmd(HYPR.scripts("hypr-cmd-screenshot file")), { description = "Save screenshot to file" })
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.exec_cmd(HYPR.scripts("hypr-cmd-screenshot region")), { description = "Save screen area to file" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(HYPR.scripts("hypr-cmd-screenshot")), { description = "Copy screen area to clipboard" })
hl.bind("SUPER + SHIFT + CTRL + S", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color picker" })

-- *************************************************************************************************
-- Keyboard
-- *************************************************************************************************
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd(HYPR.scripts("hypr-switch-keyboard-layout")), { description = "Switch keyboard layout" })
-- # trigger when the switch is turning off

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprctl keyword monitor 'eDP-1, disable'"), { description = "Disable screen on close lid" })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl keyword monitor 'eDP-1, preferred, auto, 1'"), { description = "Enable screen on close lid" })


