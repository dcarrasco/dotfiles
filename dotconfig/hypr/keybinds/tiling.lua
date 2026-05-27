-- Close window
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close active window" })

-- Cycle windows and apps
hl.bind("ALT + TAB", hl.dsp.window.cycle_next({next = true}), { description = "Change to next window" })
hl.bind("SUPER + TAB", hl.dsp.focus({last = true}), { description = "Focus last window" })

-- # Control tiling
hl.bind("SUPER + ALT + F", hl.dsp.window.float(), { description = "Toggle floating" })
hl.bind("SUPER + CTRL + F", hl.dsp.window.pin(), { description = "Pin window" })
hl.bind("SUPER + ALT + P", hl.dsp.window.pseudo(), { description = "Toggle pseudo floating" })
-- hl.bind("SUPER + S", hl.dsp.layout("togglesplit"), { description = "Toggle pseudo floating" })
hl.bind("SUPER + S", hl.dsp.layout("swapwithmaster"), { description = "Toggle pseudo floating" })
-- bindd = SUPER ALT, S, Toggle maximized window margins, exec, $hypr_scripts/hypr-master-max
hl.bind("SUPER + M", hl.dsp.window.fullscreen({mode = "maximized", action = "toggle"}), { description = "Maximize window" })
hl.bind("SUPER + ALT + M", hl.dsp.window.fullscreen({mode = "fullscreen", action = "toggle"}), { description = "Fullscreen" })
hl.bind("SUPER + CTRL + M", hl.dsp.window.fullscreen_state({internal = 0, client = 2, action = "toggle"}), { description = "Internal fullscreen" })
hl.bind("SUPER + ALT + G", hl.dsp.group.toggle(), { description = "Toggle group" })
-- bindd = SUPER CTRL, W, Toggle master/dwindle, exec, $hypr_scripts/hypr-toggle-master-dwindle

-- # Move focus
hl.bind("SUPER + H", hl.dsp.focus({direction = "left"}), { description = "Move focus to left", repeating = true })
hl.bind("SUPER + L", hl.dsp.focus({direction = "right"}), { description = "Move focus to right", repeating = true })
hl.bind("SUPER + K", hl.dsp.focus({direction = "up"}), { description = "Move focus up", repeating = true })
hl.bind("SUPER + J", hl.dsp.focus({direction = "down"}), { description = "Move focus down", repeating = true })

-- # Swap/Move window
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({direction = "left"}), { description = "Move window to left" })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({direction = "right"}), { description = "Move window to right" })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({direction = "up"}), { description = "Move window up" })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({direction = "down"}), { description = "Move window down" })

-- # Move floating window
hl.bind("SUPER + ALT + H", hl.dsp.window.move({x = "-10", y = "0", relative = true}), { description = "Move floating window to left" })
hl.bind("SUPER + ALT + L", hl.dsp.window.move({x = "+10", y = "0", relative = true}), { description = "Move floating window to right" })
hl.bind("SUPER + ALT + K", hl.dsp.window.move({x = "0", y = "-10", relative = true}), { description = "Move floating window up" })
hl.bind("SUPER + ALT + J", hl.dsp.window.move({x = "0", y = "+10", relative = true}), { description = "Move floating window down" })

-- # Resize floating window
hl.bind("SUPER + ALT + LEFT", hl.dsp.window.resize({x = "-200", y = "0", relative = true}), { description = "Shrink floating window to left" })
hl.bind("SUPER + ALT + RIGHT", hl.dsp.window.resize({x = "200", y = "0", relative = true}), { description = "Expand floating window to right" })
hl.bind("SUPER + ALT + UP", hl.dsp.window.resize({x = "0", y = "-200", relative = true}), { description = "Shrink floating window up" })
hl.bind("SUPER + ALT + DOWN", hl.dsp.window.resize({x = "0", y = "200", relative = true}), { description = "Expand floating window down" })

-- # Switch and move to workspaces with mainMod + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = key }), { description = "Switch to workspace " .. key })
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = key }), { description = "Move window to workspace " .. key })
end
-- hl.bind("SUPER + 1", hl.dsp.focus({workspace = "1"}), { description = "Switch to workspace 1" })
-- hl.bind("SUPER + 2", hl.dsp.focus({workspace = "2"}), { description = "Switch to workspace 2" })
-- hl.bind("SUPER + 3", hl.dsp.focus({workspace = "3"}), { description = "Switch to workspace 3" })
-- hl.bind("SUPER + 4", hl.dsp.focus({workspace = "4"}), { description = "Switch to workspace 4" })
-- hl.bind("SUPER + 5", hl.dsp.focus({workspace = "5"}), { description = "Switch to workspace 5" })
-- hl.bind("SUPER + 6", hl.dsp.focus({workspace = "6"}), { description = "Switch to workspace 6" })
-- hl.bind("SUPER + 7", hl.dsp.focus({workspace = "7"}), { description = "Switch to workspace 7" })
-- hl.bind("SUPER + 8", hl.dsp.focus({workspace = "8"}), { description = "Switch to workspace 8" })
-- hl.bind("SUPER + 9", hl.dsp.focus({workspace = "9"}), { description = "Switch to workspace 9" })
-- hl.bind("SUPER + 0", hl.dsp.focus({workspace = "0"}), { description = "Switch to workspace 0" })
hl.bind("SUPER + BRACELEFT", hl.dsp.focus({workspace = "-1"}), { description = "Switch to previous workspace" })
hl.bind("SUPER + BRACERIGHT", hl.dsp.focus({workspace = "+1"}), { description = "Switch to next workspace" })
hl.bind("SUPER + BRACKETLEFT", hl.dsp.focus({workspace = "-1"}), { description = "Switch to previous workspace" })
hl.bind("SUPER + BRACKETRIGHT", hl.dsp.focus({workspace = "+1"}), { description = "Switch to next workspace" })

-- # Cycle in group
hl.bind("SUPER + ALT + BRACELEFT", hl.dsp.group.prev(), { description = "Switch to previous window on group" })
hl.bind("SUPER + ALT + BRACERIGHT", hl.dsp.group.next(), { description = "Switch to next window on group" })
hl.bind("SUPER + ALT + BRACKETLEFT", hl.dsp.group.prev(), { description = "Switch to previous window on group" })
hl.bind("SUPER + ALT + BRACKETRIGHT", hl.dsp.group.next(), { description = "Switch to next window on group" })

-- # Move active window to a workspace with mainMod + SHIFT + [0-9]
-- hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({workspace = "1"}), { description = "Move window to workspace 1" })
-- hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({workspace = "2"}), { description = "Move window to workspace 2" })
-- hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({workspace = "3"}), { description = "Move window to workspace 3" })
-- hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({workspace = "4"}), { description = "Move window to workspace 4" })
-- hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({workspace = "5"}), { description = "Move window to workspace 5" })
-- hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({workspace = "6"}), { description = "Move window to workspace 6" })
-- hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({workspace = "7"}), { description = "Move window to workspace 7" })
-- hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({workspace = "8"}), { description = "Move window to workspace 8" })
-- hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({workspace = "9"}), { description = "Move window to workspace 9" })
-- hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({workspace = "0"}), { description = "Move window to workspace 0" })

-- # Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({workspace = "-1"}), { description = "Move to previous workspace" })
hl.bind("SUPER + mouse_up", hl.dsp.focus({workspace = "+1"}), { description = "Move to next workspace" })

-- # Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { description = "Resize window" })

