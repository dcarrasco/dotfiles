-- Special keys
local hypr_scripts = "$HOME/.config/hypr/scripts/"

hl.bind("XF86AudioMute", hl.dsp.exec_cmd(hypr_scripts .. "hypr-set-volume toggle"), { description = "Mute" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(hypr_scripts .. "hypr-set-volume down"), { description = "Decrease volume", repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(hypr_scripts .. "hypr-set-volume up"), { description = "Increase volume", repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(hypr_scripts .. "hypr-set-brightness down"), { description = "Decrease brightness" })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(hypr_scripts .. "hypr-set-brightness up"), { description = "Increase brightness" })

