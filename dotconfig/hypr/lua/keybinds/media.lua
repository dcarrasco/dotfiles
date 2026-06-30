return {
  -- Audio keys
  { mod = "", key = "XF86AudioMute", dsp = HYPR.fn.scripts("hypr-set-volume toggle"), desc = "Mute" },
  { mod = "", key = "XF86AudioLowerVolume", dsp = HYPR.fn.scripts("hypr-set-volume down"), desc = "Decrease volume", repeating = true },
  { mod = "", key = "XF86AudioRaiseVolume", dsp = HYPR.fn.scripts("hypr-set-volume up"), desc = "Increase volume", repeating = true },

  -- Brightness keys
  { mod = "", key = "XF86MonBrightnessDown", dsp = HYPR.fn.scripts("hypr-set-brightness down"), desc = "Decrease brightness" },
  { mod = "", key = "XF86MonBrightnessUp", dsp = HYPR.fn.scripts("hypr-set-brightness up"), desc = "Increase brightness" },
}

