return {
  -- Close window
  { key = "Q", dsp = hl.dsp.window.close(), desc = "Close active window" },

  -- Cycle windows and apps
  { mod = "", key = "ALT + TAB", dsp = hl.dsp.window.cycle_next({next = true}), desc = "Change to next window" },
  { mod = "", key = "ALT + SHIFT + TAB", dsp = hl.dsp.window.cycle_next({next = false}), desc = "Change to next window" },
  { key = "TAB", dsp = hl.dsp.focus({last = true}), desc = "Focus last window" },

  -- # Control tiling
  { key = "ALT + F", dsp = hl.dsp.window.float(), desc = "Toggle floating" },
  { key = "CTRL + F", dsp = hl.dsp.window.pin(), desc = "Pin window" },
  { key = "ALT + P", dsp = hl.dsp.window.pseudo(), desc = "Toggle pseudo floating" },
  -- { key = "SUPER + S", hl.dsp.layout("togglesplit"), { desc = "Toggle pseudo floating" },
  { key = "S", dsp = hl.dsp.layout("swapwithmaster"), desc = "Swap with master" },
  { key = "M", dsp = hl.dsp.window.fullscreen({mode = "maximized", action = "toggle"}), desc = "Maximize window" },
  { key = "ALT + M", dsp = hl.dsp.window.fullscreen({mode = "fullscreen", action = "toggle"}), desc = "Fullscreen" },
  { key = "CTRL + M", dsp = hl.dsp.window.fullscreen_state({internal = 0, client = 2, action = "toggle"}), desc = "Internal fullscreen" },
  { key = "ALT + G", dsp = hl.dsp.group.toggle(), desc = "Toggle group" },
  -- bindd = SUPER CTRL, W, Toggle master/dwindle, exec, $hypr_scripts/hypr-toggle-master-dwindle

  -- # Move focus
  { key = "H", dsp = hl.dsp.focus({direction = "left"}), desc = "Move focus to left", repeating = true },
  { key = "L", dsp = hl.dsp.focus({direction = "right"}), desc = "Move focus to right", repeating = true },
  { key = "K", dsp = hl.dsp.focus({direction = "up"}), desc = "Move focus up", repeating = true },
  { key = "J", dsp = hl.dsp.focus({direction = "down"}), desc = "Move focus down", repeating = true },

  -- # Swap/Move window
  { key = "SHIFT + H", dsp = hl.dsp.window.move({direction = "left"}), desc = "Move window to left" },
  { key = "SHIFT + L", dsp = hl.dsp.window.move({direction = "right"}), desc = "Move window to right" },
  { key = "SHIFT + K", dsp = hl.dsp.window.move({direction = "up"}), desc = "Move window up" },
  { key = "SHIFT + J", dsp = hl.dsp.window.move({direction = "down"}), desc = "Move window down" },

  -- # Move floating window
  { key = "ALT + H", dsp = hl.dsp.window.move({x = "-10", y = "0", relative = true}), desc = "Move floating window to left" },
  { key = "ALT + L", dsp = hl.dsp.window.move({x = "+10", y = "0", relative = true}), desc = "Move floating window to right" },
  { key = "ALT + K", dsp = hl.dsp.window.move({x = "0", y = "-10", relative = true}), desc = "Move floating window up" },
  { key = "ALT + J", dsp = hl.dsp.window.move({x = "0", y = "+10", relative = true}), desc = "Move floating window down" },

  -- # Resize floating window
  { key = "ALT + LEFT", dsp = hl.dsp.window.resize({x = "-150", y = "0", relative = true}), desc = "Shrink floating window to left" },
  { key = "ALT + RIGHT", dsp = hl.dsp.window.resize({x = "150", y = "0", relative = true}), desc = "Expand floating window to right" },
  { key = "ALT + UP", dsp = hl.dsp.window.resize({x = "0", y = "-150", relative = true}), desc = "Shrink floating window up" },
  { key = "ALT + DOWN", dsp = hl.dsp.window.resize({x = "0", y = "150", relative = true}), desc = "Expand floating window down" },

  -- # Switch and move to workspaces with mainMod + [0-9]
  { key = "1", dsp = hl.dsp.focus({workspace = "1"}), desc = "Switch to workspace 1" },
  { key = "2", dsp = hl.dsp.focus({workspace = "2"}), desc = "Switch to workspace 2" },
  { key = "3", dsp = hl.dsp.focus({workspace = "3"}), desc = "Switch to workspace 3" },
  { key = "4", dsp = hl.dsp.focus({workspace = "4"}), desc = "Switch to workspace 4" },
  { key = "5", dsp = hl.dsp.focus({workspace = "5"}), desc = "Switch to workspace 5" },
  { key = "6", dsp = hl.dsp.focus({workspace = "6"}), desc = "Switch to workspace 6" },
  { key = "7", dsp = hl.dsp.focus({workspace = "7"}), desc = "Switch to workspace 7" },
  { key = "8", dsp = hl.dsp.focus({workspace = "8"}), desc = "Switch to workspace 8" },
  { key = "9", dsp = hl.dsp.focus({workspace = "9"}), desc = "Switch to workspace 9" },
  { key = "0", dsp = hl.dsp.focus({workspace = "0"}), desc = "Switch to workspace 0" },
  { key = "BRACELEFT", dsp = hl.dsp.focus({workspace = "-1"}), desc = "Switch to previous workspace" },
  { key = "BRACERIGHT", dsp = hl.dsp.focus({workspace = "+1"}), desc = "Switch to next workspace" },
  { key = "BRACKETLEFT", dsp = hl.dsp.focus({workspace = "-1"}), desc = "Switch to previous workspace" },
  { key = "BRACKETRIGHT", dsp = hl.dsp.focus({workspace = "+1"}), desc = "Switch to next workspace" },

  -- # Cycle in group
  { key = "ALT + BRACELEFT", dsp = hl.dsp.group.prev(), desc = "Switch to previous window on group" },
  { key = "ALT + BRACERIGHT", dsp = hl.dsp.group.next(), desc = "Switch to next window on group" },
  { key = "ALT + BRACKETLEFT", dsp = hl.dsp.group.prev(), desc = "Switch to previous window on group" },
  { key = "ALT + BRACKETRIGHT", dsp = hl.dsp.group.next(), desc = "Switch to next window on group" },

  -- # Move active window to a workspace with mainMod + SHIFT + [0-9]
  { key = "SHIFT + 1", dsp = hl.dsp.window.move({workspace = "1"}), desc = "Move window to workspace 1" },
  { key = "SHIFT + 2", dsp = hl.dsp.window.move({workspace = "2"}), desc = "Move window to workspace 2" },
  { key = "SHIFT + 3", dsp = hl.dsp.window.move({workspace = "3"}), desc = "Move window to workspace 3" },
  { key = "SHIFT + 4", dsp = hl.dsp.window.move({workspace = "4"}), desc = "Move window to workspace 4" },
  { key = "SHIFT + 5", dsp = hl.dsp.window.move({workspace = "5"}), desc = "Move window to workspace 5" },
  { key = "SHIFT + 6", dsp = hl.dsp.window.move({workspace = "6"}), desc = "Move window to workspace 6" },
  { key = "SHIFT + 7", dsp = hl.dsp.window.move({workspace = "7"}), desc = "Move window to workspace 7" },
  { key = "SHIFT + 8", dsp = hl.dsp.window.move({workspace = "8"}), desc = "Move window to workspace 8" },
  { key = "SHIFT + 9", dsp = hl.dsp.window.move({workspace = "9"}), desc = "Move window to workspace 9" },
  { key = "SHIFT + 0", dsp = hl.dsp.window.move({workspace = "0"}), desc = "Move window to workspace 0" },

  -- # Scroll through existing workspaces with mainMod + scroll
  { key = "mouse_down", dsp = hl.dsp.focus({workspace = "-1"}), desc = "Move to previous workspace" },
  { key = "mouse_up", dsp = hl.dsp.focus({workspace = "+1"}), desc = "Move to next workspace" },

  -- # Move/resize windows with mainMod + LMB/RMB and dragging
  { key = "mouse:272", dsp = hl.dsp.window.drag(), desc = "Move window" },
  { key = "mouse:273", dsp = hl.dsp.window.resize(), desc = "Resize window" },

}

