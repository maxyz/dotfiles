local M = {}

-- Path to overriding theme and highlights files
M.ui = {
  theme = "pastelbeans",
  theme_toggle = { "pastelbeans", "one_light" },

  hl_override = {
    Comment = { fg = "orange" },
    ["@comment"] = { fg = "orange" },
    NvimTreeOpenedFolderName = { fg = "green" },
  },

  hl_add = {
  },
}

return M
