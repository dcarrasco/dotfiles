return {
  -- *************************************************************************************************
  -- Menus
  -- *************************************************************************************************
  { key = "SPACE", dsp = HYPR.apps.launcher, desc = "Open launcher" },
  { key = "ALT + SPACE", dsp = HYPR.fn.scripts("hypr-sys-menu"), desc = "System menu" },
  { key = "CTRL + SPACE", dsp = HYPR.apps.launcher_run, desc = "Open run launcher" },
  { key = "CTRL + V", dsp = HYPR.fn.scripts("hypr-list-vm"), desc = "List virtual machines" },
  { key = "CTRL + Q", dsp = HYPR.apps.logout, desc = "System menu" },
  { key = "comma", dsp = HYPR.fn.scripts("hypr-edit-config"), desc = "Edit config files" },
  { key = "XF86AudioMute", dsp = HYPR.fn.scripts("hypr-show-keybinds"), desc = "Show keyboard bindings" },
  { key = "F1", dsp = HYPR.fn.scripts("hypr-show-keybinds"), desc = "Show keyboard bindings" },
  { mod = "", key = "Help", dsp = HYPR.fn.scripts("hypr-show-keybinds"), desc = "Show keyboard bindings" },
  { key = "P", dsp = HYPR.fn.scripts("hypr-switch-monitor"), desc = "Monitors menu" },
  { key = "ALT + Q", dsp = hl.dsp.exit(), desc = "Exit Hyprland" },

  -- *************************************************************************************************
  -- Aesthetics
  -- *************************************************************************************************
  { key = "XF86MonBrightnessDown", dsp = HYPR.fn.scripts("hypr-switch-wallpaper previous"), desc = "Previo fondo de pantalla" },
  { key = "XF86MonBrightnessUp", dsp = HYPR.fn.scripts("hypr-switch-wallpaper next"), desc = "Siguiente fondo de pantalla" },
  { key = "ALT + R", dsp = HYPR.fn.scripts("hypr-restore-waybar"), desc = "Reset Waybar" },
  { key = "XF86Favorites", dsp = HYPR.fn.scripts("hypr-restore-waybar"), desc = "Reset Waybar" },
  --
  -- *************************************************************************************************
  -- Screenshots
  -- *************************************************************************************************
  { mod = "", key = "Print", dsp = HYPR.fn.scripts("hypr-cmd-screenshot file"), desc = "Save screenshot to file" },
  { key = "SUPER + SHIFT + ALT + S", dsp = HYPR.fn.scripts("hypr-cmd-screenshot region"), desc = "Save screen area to file" },
  { key = "SUPER + SHIFT + S", dsp = HYPR.fn.scripts("hypr-cmd-screenshot"), desc = "Copy screen area to clipboard" },
  { key = "SUPER + SHIFT + CTRL + S", dsp = "pkill hyprpicker || hyprpicker -a", desc = "Color picker" },

  -- *************************************************************************************************
  -- Keyboard
  -- *************************************************************************************************
  { key = "SHIFT + SPACE", dsp = HYPR.fn.scripts("hypr-switch-keyboard-layout"), desc = "Switch keyboard layout" },
  { mod = "", key = "switch:on:Lid Switch", dsp = "hyprctl keyword monitor 'eDP-1, disable'", desc = "Disable screen on close lid" },
  { mod = "", key = "switch:off:Lid Switch", dsp = "hyprctl keyword monitor 'eDP-1, preferred, auto, 1'", desc = "Enable screen on close lid" },
}

