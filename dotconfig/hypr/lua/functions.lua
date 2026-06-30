return {

  hex_rgb = function (hex)
    return "rgb(" .. hex .. ")"
  end,

  hex_rgba = function (hex, alpha)
    return "rgba(" .. hex .. alpha .. ")"
  end,

  scripts = function (script)
    return "uwsm app -- " .. HYPR.scripts_path .. "/" .. script
  end,

  app = function (application)
    local uwsm = "uwsm app -- "
    if HYPR.use_uwsm == false then
      uwsm = ""
    end
    return uwsm .. application
  end,

  keybind = function (binds)
    local mainMod = HYPR.mainMod .. " + "

    for _, bind in ipairs(binds) do
      local mod = bind.mod or mainMod

      local command
      if type(bind.dsp) ~= "string" then
        command = bind.dsp
        -- hl.notification.create({ text = bind.desc, timeout = 3000 })
      else
        command = hl.dsp.exec_cmd(bind.dsp)
      end

      local opts = {}
      if bind.desc then
        opts.desc = bind.desc
      end
      if bind.repeating then
        opts.repeating = bind.repeating
      end

      hl.bind(mod .. bind.key, command, opts)
    end
  end,
}
