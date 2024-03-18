local M = {}

-- Debug
-- vim.api.nvim_echo({ { "msg", "None" } }, false, {})

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

M.codeium = {
  i = {
    ["<M-CR>"] = {
      function()
        -- "<Plug>call codeium#Accept()<CR>"
        return vim.api.nvim_input(vim.fn["codeium#Accept"]())
      end,
      "Codeium apply",
    },
  },
  n = {
    ["<leader>c\\"] = {
      function()
        vim.fn["codeium#Chat"]()
      end,
      "Codeium chat",
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

M.refactoring = {
  n = {
    ["<leader>ri"] = {
      function()
        return require("refactoring").refactor "Inline Variable"
      end,
      "refactor variable to inline",
    },
    ["<leader>rb"] = {
      function()
        return require("refactoring").refactor "Extract Block"
      end,
      "refactor block",
    },
    ["<leader>rF"] = {
      function()
        return require("refactoring").refactor "Extract Block To File"
      end,
      "refactor block to file",
    },
  },
  x = {
    ["<leader>re"] = {
      function()
        return require("refactoring").refactor "Extract Function"
      end,
      "refactor function",
    },
    ["<leader>rf"] = {
      function()
        return require("refactoring").refactor "Extract Function To File"
      end,
      "refactor function to file",
    },
    ["<leader>rv"] = {
      function()
        return require("refactoring").refactor "Extract Variable"
      end,
      "refactor variable",
    },
    ["<leader>rI"] = {
      function()
        return require("refactoring").refactor "Inline Function"
      end,
      "refactor function to inline",
    },
    ["<leader>ri"] = {
      function()
        return require("refactoring").refactor "Inline Variable"
      end,
      "refactor variable to inline",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>tt"] = { "<cmd> Trouble <cr>", "first trouble" },
    ["]R"] = {
      function()
        require("trouble").first { skip_groups = true, jump = true }
      end,
      "first trouble",
    },
    ["[R"] = {
      function()
        require("trouble").last { skip_groups = true, jump = true }
      end,
      "last trouble",
    },
    ["]r"] = {
      function()
        require("trouble").next { skip_groups = true, jump = true }
      end,
      "next trouble",
    },
    ["[r"] = {
      function()
        require("trouble").previous { skip_groups = true, jump = true }
      end,
      "previous trouble",
    },
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
