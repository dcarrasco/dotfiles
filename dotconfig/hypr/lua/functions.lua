HYPR.hex_rgb = function (hex)
  return "rgb(" .. hex .. ")"
end

HYPR.hex_rgba = function (hex, alpha)
  return "rgba(" .. hex .. alpha .. ")"
end

HYPR.scripts = function (script)
  return "uwsm app -- " .. HYPR.scripts_path .. "/" .. script
end
