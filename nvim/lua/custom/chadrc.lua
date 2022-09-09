local M = {
  options = {},
  plugins = require("custom.plugins"),
  mappings = require("custom.mappings"),
}

M.ui = {
  theme_toggle = { "mountain", "one_light" },
  theme = "mountain",
}

return M
