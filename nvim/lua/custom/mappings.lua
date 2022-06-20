local M = {}

M.gundo =  {
  n = {
    ["<F6>"] = { "<cmd> GundoToggle <CR>", "Toggle undo tree" },
  }
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeFindFile <CR>", "   focus nvimtree" },
  }
}

M.telescope = {
  n = {
    ["<leader>cc"] = { "<cmd> Telescope <CR>", "open telescope" },
  },
}

M._local = {
  n = {
    ["<leader>q"] = { "<cmd> bd <CR>", "Close current buffer" },
    ["Q"] = { "gq", "Format paragraph" },
  },
  x = {
    ["Q"] = { "gq", "Format selection" },
  }
}

return M
