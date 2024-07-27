local M = {}

-- Path to overriding theme and highlights files
M.ui = {
  theme = "rosepine",
  theme_toggle = { "rosepine", "one_light" },
  -- transparency = true,

  hl_override = {
    Comment = { fg = "orange" },
    ["@comment"] = { fg = "orange" },
    NvimTreeOpenedFolderName = { fg = "green" },
    ["@annotation"] = { fg = "#31748f" },
    ["@punctuation.bracket"] = { fg = "#31748f" },
    ["@punctuation.delimiter"] = { fg = "#31748f" },
    ["@tag.delimiter"] = { fg = "#31748f" },
    ["@text.strike"] = { fg = "#31748f", strikethrough = true },
  },

  hl_add = {},

  statusline = {
    order = { "mode", "file", "git", "%=", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    theme = "minimal",
  },
}

return M
