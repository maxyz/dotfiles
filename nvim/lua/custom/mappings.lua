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
    ["<leader>q"] = { "<cmd> q <CR>", "Close current buffer" },
    ["Q"] = { "gq", "Format paragraph" },
    ["QQ"] = { "gqq", "Format full paragraph" },
  },
}

return M
