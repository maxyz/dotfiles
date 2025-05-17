local M = {
  cmdline = { enabled = false },
  completion = {
    -- ghost_text = { enabled = false },
    menu = {
      auto_show = false,
    },
    documentation = {
      auto_show = false,
    },
    list = {
      selection = {
        preselect = false,
      },
    },
  },
  keymap = {
    ["<CR>"] = {},
    ["<C-m>"] = { "accept", "fallback" },
  },
}

return M
