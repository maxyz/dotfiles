local M = {}

-- Path to overriding theme and highlights files
M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },
  -- transparency = true,

  hl_override = {
    Comment = { fg = "orange" },
    ["@comment"] = { fg = "orange" },
    NvimTreeOpenedFolderName = { fg = "green" },
  },

  hl_add = {},

  statusline = {
    theme = "minimal",
  },
}

return M
