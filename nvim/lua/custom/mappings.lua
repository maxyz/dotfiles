local M = {}

M.general = {
  -- n = {
  --   ["<leader>fm"] = {
  --     function()
  --       require("conform").format()
  --     end,
  --     "formatting",
  --   },
  -- },
}

M.cmp = {
  n = {
    ["<leader>tc"] = {
      function()
        vim.g.cmp_toggle_flag = not vim.g.cmp_toggle_flag
      end,
      "Toggle completion",
    },
  },
}

M.mundo = {
  n = {
    ["<F6>"] = { "<cmd> MundoToggle <CR>", "Toggle undo tree" },
  },
}

M.telescope = {
  n = {
    ["<leader>cc"] = { "<cmd> Telescope <CR>", "open telescope" },
  },
}

-- M.magmanvim = {
--   n = {
--     ["<localleader>r"] = { "'<cmd> MagmaEvaluateOperator <CR>'", "magma evaluate operator", expr = true },
--     ["<localleader>rr"] = { "<cmd> MagmaEvaluateLine <CR>", "magma evaluate line" },
--     ["<localleader>rc"] = { "<cmd> MagmaReevaluateCell <CR>", "magma reevaluate cell" },
--     ["<localleader>rd"] = { "<cmd> MagmaDelete <CR>", "magma delete" },
--     ["<localleader>ro"] = { "<cmd> MagmaShowOutput <CR>", "magma show output" },
--   },
--   x = {
--     ["<localleader>r"] = { ":<C-u>MagmaEvaluateVisual<CR>", "magma evaluate visual" },
--   },
-- }

M._local = {
  n = {
    ["Q"] = { "gq", "Format paragraph" },
    ["<leader>fl"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    -- ["<leader>fm"] = {
    --   function()
    --     require("conform").format()
    --   end,
    --   "formatting",
    -- },
  },
  x = {
    ["Q"] = { "gq", "Format selection" },
  },
}

return M
