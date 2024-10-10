local cmp = require "cmp"

local M = {
  completion = {
    autocomplete = false,
    completeopt = "menu,menuone,noselect",
  },
  preselect = cmp.PreselectMode.None,
  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    },
  },
}

return M
