local M = {
  options = {},
  plugins = require "custom.plugins",
  mappings = require "custom.mappings",
}

M.ui = {
  theme_toggle = { "pastelDark", "one_light" },
  theme = "pastelDark",
}

return M
